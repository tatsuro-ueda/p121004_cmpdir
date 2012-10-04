//
//  MyUtility.h
//  cmpdir_test2
//
//  Created by stky on 2012/10/04.
//  Copyright (c) 2012年 stky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUtility : NSObject

+ (void)mkdir:(NSString *)dirName;
+ (void)print:(NSString *)string withFilePath:(NSString *)filePath;
+ (void)delete:(NSString *)path;
+ (NSArray *)list:(NSString *)path;


@end
