//
//  AddressBook.m
//  AddressBook
//
//  Created by Derek Graham on 7/12/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "AddressBook.h"
#import "Person.h"

@interface AddressBook ()
@property (strong, nonatomic) NSMutableDictionary *addressBook;
@end

@implementation AddressBook

+ (nonnull instancetype)shared
{
    static AddressBook *shared = nil;
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
        _addressBook = [self setupPreferences];
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
    [self.addressBook setObject:object forKey:key];
    [self sync];
}
- (nonnull id)objectForKey:(nonnull NSString *)key
{
    return [self.addressBook objectForKey:key];
}
- (void) reset
{
    NSError *error; // FIXME check for error conditions that this succeded.
    [[NSFileManager defaultManager]removeItemAtURL:[self preferencesURL] error:nil];
    [self.addressBook removeAllObjects];
    [self sync];
}

- (void) sync
{
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.addressBook options:NSJSONWritingPrettyPrinted error:&error];
    if (!error && jsonData) {
        if ([jsonData writeToFile:[[self preferencesURL]path] atomically:YES]) {
            [[NSNotificationCenter defaultCenter]postNotificationName:kDGUserDefaultsDidUpdate object:nil];
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
    return [[self documentsDirectory]URLByAppendingPathComponent:@"addressbook.json"];
}

@end
