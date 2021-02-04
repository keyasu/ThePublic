//
//  NSArray+SafeObjectAt.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "NSArray+SafeObjectAt.h"

@implementation NSArray (SafeObjectAt)

-(id)SafeObjectAt:(NSInteger)index{
    if (self.count > index) {
        return [self objectAtIndex:index];
    }
    return @"";
}


@end
