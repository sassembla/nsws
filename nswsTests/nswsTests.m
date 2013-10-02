//
//  nswsTests.m
//  nswsTests
//
//  Created by sassembla on 2013/10/02.
//  Copyright (c) 2013年 sassembla. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"

#define TEST_TAREGET    (@"ws://127.0.0.1:8823")

@interface nswsTests : XCTestCase {
    AppDelegate * del;
}

@end

@implementation nswsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    [del close];
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void) testIgniteThenConnectManually {
    NSDictionary * params = @{KEY_TARGET:TEST_TAREGET};
    del = [[AppDelegate alloc]initAppDelegateWithParam:params];
    
    while ([del isConnecting]) {
        [[NSRunLoop mainRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    }
    
}


@end
