//
//  DGUserDefaults.m
//  DGUserDefaults
//
//  Created by Derek Graham on 7/12/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "DGUserDefaults.h"


@interface DGUserDefaults ()

@property (strong, nonatomic) NSMutableDictionary *preferences;

@end


@implementation DGUserDefaults

+ (nonnull instancetype)shared
{
    static DGUserDefaults *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared =[[[self class]alloc]init];
    });
    
    return shared;
}

- (instancetype)init
   {
       self = [super init];
       if (self) {
           _preferences = [self setupPreferences];
       }
       
       return self;
   }

- (NSMutableDictionary *)setupPreferences
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfURL:[self preferencesURL]];
    
    if (jsonData) {
        NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        
        if (!error && json) {
            return json;
        }
    
    }
    
    return [[NSMutableDictionary alloc]init];
}
- (void) setObject:(nonnull id)object forKey: (nonnull NSString *)key
{
    [self.preferences setObject:object forKey:key];
    [self sync];
}
- (nonnull id)objectForKey:(nonnull NSString *)key
{
    return [self.preferences objectForKey:key];
}
- (void) reset
{
    NSError *error; // FIXME check for error conditions that this succeded.
    [[NSFileManager defaultManager]removeItemAtURL:[self preferencesURL] error:nil];
    [self.preferences removeAllObjects];
    [self sync];
}

- (void) sync
{
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.preferences options:NSJSONWritingPrettyPrinted error:&error];
    if (!error && jsonData) {
        if ([jsonData writeToFile:[[self preferencesURL]path] atomically:YES]) {
            [[NSNotificationCenter defaultCenter]postNotificationName:kDGUserDefaultsDidUpdate object:nil];
            NSLog(@"%@",[[self preferencesURL]path]);
        }
    }
}

#pragma mark - helper methods
- (NSURL *)documentsDirectory
{
    return [[[ NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
}

- (NSURL *)preferencesURL
{
    return [[self documentsDirectory]URLByAppendingPathComponent:@"preferences.json"];
}

@end
