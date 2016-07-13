//
//  Savant.m
//  week6-day1-lab
//
//  Created by Derek Graham on 7/11/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "Savant.h"
#import "NSString+NSStringCategory.h"


@implementation Savant

- (void) spewTypeFromID: (id)spewType
{
    NSLog(@"Savant Person spewing type info about: %@", spewType);
    NSMutableDictionary *objectCount = [NSMutableDictionary new];
    NSInteger currentCount = 0 ;
    NSString* currentClass;
    
    if ([spewType isKindOfClass:[NSString class]]) {
        NSLog(@"String - reversed: %@", [[self personType ] reverseString]);
        
        
    } else if ([spewType isKindOfClass:[NSArray class]]) {
        NSLog(@"Array");
        for (int i = 0; i < [[self personType]count]; i++){
            currentClass = NSStringFromClass([[[self personType] objectAtIndexedSubscript:i] class]);
            
            currentCount = [[objectCount objectForKey: currentClass] intValue];
            if (currentCount <= 0) {
                [objectCount setObject:[NSNumber numberWithInt:(long) 1] forKey:currentClass];
            } else {
                currentCount ++;
                [objectCount setObject:[NSNumber numberWithInt: currentCount] forKey:currentClass];
                
            }
        }
        NSLog(@"%@",objectCount);
        
    } else if ([[self personType] isKindOfClass:[NSNumber class]]) {
        NSLog(@"Number - Square Root: %f", sqrt([[self personType] doubleValue]));
        
    }

}

- (void)talk
{
    NSLog(@"talk method");
}

@end
