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
#define TEST_MESSAGE    (@"message")

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

/**
 connect then disconnect
 */
- (void) testIgniteThenConnectManually {
    NSDictionary * params = @{KEY_TARGET:TEST_TAREGET,
                              KEY_MESSAGE:TEST_MESSAGE,
                              KEY_QUIT:@""
                              };
    del = [[AppDelegate alloc]initAppDelegateWithParam:params];
    
    while ([del isConnecting]) {
        [[NSRunLoop mainRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    }
    
}

/**
 send message
 */
- (void) testConnectThenSendMessage {
    NSDictionary * params = @{KEY_TARGET:TEST_TAREGET,
                              KEY_MESSAGE:TEST_MESSAGE,
                              KEY_QUIT:@""
                              };
    del = [[AppDelegate alloc]initAppDelegateWithParam:params];
    
    while ([del isConnecting]) {
        [[NSRunLoop mainRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    }
    
    // del messageCount updated
    XCTAssert([del messageCount] == 1, @"not match, %ld", [del messageCount]);
}

/**
 Header and footer
 */
- (void) testConnectThenSendMessageWithHeaderAndFooter {
    NSDictionary * params = @{KEY_TARGET:TEST_TAREGET,
                              KEY_MESSAGE:TEST_MESSAGE,
                              KEY_QUIT:@""
                              };
    del = [[AppDelegate alloc]initAppDelegateWithParam:params];
    
    while ([del isConnecting]) {
        [[NSRunLoop mainRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    }
    
    // header***footerフォーマットの実装
    XCTFail(@"not yet implemented. YAGNI...");
}


/**
 with Filter
 */
- (void) testConnectThenSendMessageWithFilter {
    NSDictionary * params = @{KEY_TARGET:TEST_TAREGET,
                              KEY_MESSAGE:TEST_MESSAGE,
                              KEY_QUIT:@""
                              };
    del = [[AppDelegate alloc]initAppDelegateWithParam:params];
    
    while ([del isConnecting]) {
        [[NSRunLoop mainRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    }
    
    // プログラマブルなフィルタを書きたいなーprefix一致とかsuffix一致とか
    XCTFail(@"not yet implemented. YAGNI...");
}



@end
