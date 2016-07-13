//
//  MBUserDefaults.m
//  Week6-Class27
//
//  Created by Sean Champagne on 7/12/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "MBUserDefaults.h"

@interface MBUserDefaults ()

@property (strong, nonatomic) NSMutableDictionary *preferences;

@end

@implementation MBUserDefaults

+(nonnull instancetype)sharedDefaults; //writing a singleton class method.
{
    static MBUserDefaults *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    return shared;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        _preferences = [self setupUserDefaults];
    }
    return self;
}

-(NSMutableDictionary *)setupUserDefaults
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

-(void)setObject:(nonnull id)object forKey: (nonnull NSString *)key //this instance method sets the object as the key.
{
    [self.preferences setObject:object forKey:key]; //setting object on this key for our userDefault dictionary
    [self sync];
}
-(nonnull id)objectForKey:(nonnull NSString *)key //returns the id when a key is passed in.
{
    return [self.preferences objectForKey:key]; //getting object
}

-(void)reset //deletes all.
{
    [[NSFileManager defaultManager]removeItemAtURL:[self preferencesURL] error:nil]; //removes all.
    [self.preferences removeAllObjects];
    [self sync];
}

-(void)sync
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.preferences options:NSJSONWritingPrettyPrinted error:&error];
    
    if (!error && jsonData)
    {
        if ([jsonData writeToFile:[[self preferencesURL]path] atomically:YES])
        {
            [[NSNotificationCenter defaultCenter]postNotificationName:kMBUserDefaultsDidUpdate object:nil];
        }
    }
}

#pragma mark - Helper Methods

- (NSURL *)documentsDirectionry
{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
}

- (NSURL * )preferencesURL
{
    return [[self documentsDirectionry]URLByAppendingPathComponent:@"preferences.json"];
}

@end
