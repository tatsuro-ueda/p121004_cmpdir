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
    STAssertEquals(expected, actual, @"");
}

- (void)testDescription
{
    NSString *expected = @"Foo";
    NSString *actual = [[[Directory alloc] initWithName:@"Foo"] description];
    STAssertEquals(expected, actual, @"");
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
}
@end
