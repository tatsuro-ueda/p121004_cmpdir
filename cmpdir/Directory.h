//
//  Directory.h
//  cmpdir_test
//
//  Created by stky on 2012/10/02.
//  Copyright (c) 2012年 stky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardPaths.h"

@interface Directory : NSObject

@property NSString *name;

- (id)initWithName:(NSString *)name;
- (NSString *)description;
- (NSArray *)files;

@end
