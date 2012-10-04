//
//  cmpdir_testTests.m
//  cmpdir_testTests
//
//  Created by stky on 2012/10/02.
//  Copyright (c) 2012年 stky. All rights reserved.
//

#import "cmpdirTests.h"
#import "StandardPaths.h"
#import "MyUtility.h"

@implementation cmpdirTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testInit
{
    id expected = [Directory class];
    id actual = [[[Directory alloc] initWithName:@"Foo"] class];
    STAssertEqualObjects(expected, actual, @"");
}

- (void)testDescription
{
    NSString *expected = @"Foo";
    NSString *actual = [[[Directory alloc] initWithName:@"Foo"] description];
    STAssertEqualObjects(expected, actual, @"");
}

- (void)testFiles
{
    id expect = @[@"file1"];
    [MyUtility mkdir:@"testdir"];
    [MyUtility print:@"this is file1" withFilePath:@"testdir/file1"];
    @try {
        Directory *dir = [[Directory alloc] initWithName:@"testdir"];
        id actual = [dir files];
        STAssertEqualObjects(expect, actual, @"expect = %@, actual = %@", expect, actual);
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    @finally {
        [MyUtility delete:@"testdir/file1"];
        [MyUtility delete:@"testdir"];
    }
    
    expect = @[];
    [MyUtility mkdir:@"empty_dir"];
    @try {
        Directory *dir = [[Directory alloc] initWithName:@"empty_dir"];
        id actual = [dir files];
        STAssertEqualObjects(expect, actual, @"expect = %@, actual = %@", expect, actual);
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    @finally {
        [MyUtility delete:@"empty_dir"];
    }
    
    expect = @[@"file_a", @"file_b", @"file_c"];
    [MyUtility mkdir:@"dir_somefiles"];
    [self createFile:@"dir_somefiles/file_b"];
    [self createFile:@"dir_somefiles/file_a"];
    [self createFile:@"dir_somefiles/file_c"];
    @try {
        Directory *dir2 = [[Directory alloc] initWithName:@"dir_somefiles"];
        id actual = [dir2 files];
        STAssertEqualObjects(expect, actual, @"");
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    @finally {
        [MyUtility delete:@"dir_somefiles/file_b"];
        [MyUtility delete:@"dir_somefiles/file_a"];
        [MyUtility delete:@"dir_somefiles/file_c"];
        [MyUtility delete:@"dir_somefiles"];
    }
}

- (void)createFile:(NSString *)path
{
    [MyUtility print:[NSString stringWithFormat:@"This is %@", path] withFilePath:path];
}
@end
