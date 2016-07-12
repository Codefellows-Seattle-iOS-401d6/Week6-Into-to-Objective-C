//
//  CustomizedUserDefaults.m
//  CustomizedUserDefaults
//
//  Created by Olesia Kalashnik on 7/12/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "CustomizedUserDefaults.h"

@interface CustomizedUserDefaults ()

@property (strong, nonatomic) NSMutableDictionary *preferences;
@end

@implementation CustomizedUserDefaults

+ (nonnull instancetype)shared {
    static CustomizedUserDefaults *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    return shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _preferences = [self setupPreferences];
    }
    return self;
}


- (NSMutableDictionary *)setupPreferences {
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

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key {
    [self.preferences setObject:object forKey:key];
    [self sync];
}

- (nonnull id)objectForKey:(nonnull NSString *)key {
    return [self.preferences objectForKey:key];
}
- (void)reset {
    NSError *error;
    [[NSFileManager defaultManager]removeItemAtURL:[self preferencesURL] error:&error];
    if (!error) {
        [self.preferences removeAllObjects];
        [self sync];
    }
}

- (void)sync {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.preferences options:NSJSONWritingPrettyPrinted error:&error];
    
    if (!error && jsonData) {
        if ([jsonData writeToFile:[[self preferencesURL]path] atomically:YES]) {
            [[NSNotificationCenter defaultCenter]postNotificationName:kCustomizedUserDefaultsDidUpdate object:nil];
        }
    }
}

#pragma mark - Helper Methods
- (NSURL *)documentsDirectory {
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
}
- (NSURL *)preferencesURL {
    NSURL* prefURL = [[self documentsDirectory]URLByAppendingPathComponent:@"preferences.json"];
    NSLog(@"%@", prefURL);
    return prefURL;
}

@end
