//
//  NSArray+SafeObjectAt.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SafeObjectAt)

-(id)SafeObjectAt:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
