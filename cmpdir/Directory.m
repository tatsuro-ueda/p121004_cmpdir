//
//  Directory.m
//  cmpdir_test
//
//  Created by stky on 2012/10/02.
//  Copyright (c) 2012年 stky. All rights reserved.
//

#import "Directory.h"
#import "MyUtility.h"

@implementation Directory

- (id)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        // 初期化
        _name = name;
    }
    return self;
}

- (NSString *)description
{
    return _name;
}

- (NSArray *)files
{
    NSArray *array = [MyUtility list:_name];
    array = [array sortedArrayUsingSelector:@selector(compare:)];
    return array;
}
@end
