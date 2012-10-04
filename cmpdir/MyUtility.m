//
//  MyUtility.m
//  cmpdir_test2
//
//  Created by stky on 2012/10/04.
//  Copyright (c) 2012年 stky. All rights reserved.
//

#import "MyUtility.h"
#import "StandardPaths.h"

@implementation MyUtility

+ (void)mkdir:(NSString *)dirName;
{
    NSString *path = [[NSFileManager defaultManager] pathForPrivateFile:dirName];
    NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
}

+ (void)print:(NSString *)string withFilePath:(NSString *)filePath;
{
    NSError *error;
    [string writeToFile:[[NSFileManager defaultManager] pathForPrivateFile:filePath] atomically:YES encoding:NSUTF8StringEncoding error:&error];
}

+ (void)delete:(NSString *)path
{
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:[[NSFileManager defaultManager] pathForPrivateFile:path] error:&error];
}

+ (NSArray *)list:(NSString *)path
{
    NSError *error;
    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[[NSFileManager defaultManager] pathForPrivateFile:path] error:&error];
}

@end
