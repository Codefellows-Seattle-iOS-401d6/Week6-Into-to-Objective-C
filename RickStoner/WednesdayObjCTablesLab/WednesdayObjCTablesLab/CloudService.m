//
//  CloudService.m
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/14/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "CloudService.h"

@interface CloudService()

@property (strong, nonatomic) CKContainer *container;
@property (strong, nonatomic) CKDatabase *database;

@end


@implementation CloudService

+ (instancetype)shared{
    static CloudService *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    return shared;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _container = [CKContainer defaultContainer];
        _database = [_container privateCloudDatabase];
    }
    return self;
}

- (void)enqueueOperation:(CloudServiceCompletion)completion{
    
}

-(void)enqueueOperation:(CloudOperation)operation student:(Student *)student completion:(CloudServiceCompletion)completion {
    
}

#pragma Mark - Helper Functions

- (void)save:(Student *)student{
    
}

- (void)delete:(Student *)student completion:(CloudServiceCompletion)completion {
    
}

- (void)retrieve:(CloudServiceCompletion)completion;{
    
}

@end
