//
//  MBUserDefaults.m
//  addressBook
//
//  Created by hannah gaskins on 7/12/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "MBUserDefaults.h"

@interface MBUserDefaults ()

@property (strong, nonatomic) NSMutableDictionary *preferences;

@end

@implementation MBUserDefaults

+ (instancetype)sharedDefaults
{
    static MBUserDefaults *sharedDefaults = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDefaults = [[[self class]alloc]init];
    });
    
    return sharedDefaults;
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
    NSData *json = [NSData dataWithContentsOfURL:[self preferencesURL]
        ];
    
    if (json) {
        
        NSMutableDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:json
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:&error];
        if (!error && json) {
            return jsonData;
        }
    }
    
    return [[NSMutableDictionary alloc]init];
}

- (void)setObject:(id)object forKey:(NSString *)key
{
    [self.preferences setObject:object forKey:key];
    [self sync];
}

- (id)objectForKey:(NSString *)key
{
    return [self.preferences objectForKey:key];
}

- (void)sync
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.preferences options:NSJSONWritingPrettyPrinted error:&error];
    if (!error && jsonData) {
        if ([jsonData writeToFile:[[self preferencesURL]path] atomically:YES]) {
            [[NSNotificationCenter defaultCenter]postNotificationName:kMBUserDefaultsDidUpdate object:nil];
        }
    }
}

- (void)reset
{
    [[NSFileManager defaultManager]removeItemAtURL:[self preferencesURL] error:nil];
    [self.preferences removeAllObjects];
    [self sync];
}

#pragma  mark - Helper Functions

- (NSURL *)documentsDirectory
{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
}

- (NSURL *)preferencesURL
{
    return [[self documentsDirectory]URLByAppendingPathComponent:@"preferences.json"];
}

@end





















