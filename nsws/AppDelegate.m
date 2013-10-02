//
//  AppDelegate.m
//  nsws
//
//  Created by sassembla on 2013/10/02.
//  Copyright (c) 2013年 sassembla. All rights reserved.
//

#import "AppDelegate.h"

#define KEY_XCTEST  (@"-XCTest")

@implementation AppDelegate {
    SRWebSocket * m_client;
    int m_state;
}

/**
 パラメータをもとに接続先をセットする
 */
- (id) initAppDelegateWithParam:(NSDictionary * )dict {

    // abort when test-run
    if (dict[KEY_XCTEST]) {
        return nil;
    }
    
    if (self = [super init]) {
        NSAssert1(dict[KEY_TARGET], @"%@ rewuired", KEY_TARGET);
        
        m_client = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:dict[KEY_TARGET]]];
        [m_client setDelegate:self];
        [m_client open];
        
        m_state = STATE_CONNECTING;
    }
    return self;
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"");
}


/**
 SocketRocket delegates
 */
- (void)webSocket:(SRWebSocket * )webSocket didReceiveMessage:(id)message {}


- (void)webSocketDidOpen:(SRWebSocket * )webSocket {
    m_state = STATE_CONNECTED;
}

- (void)webSocket:(SRWebSocket * )webSocket didFailWithError:(NSError * )error {
    m_state = STATE_FAILEDTOCONNECT;
    NSLog(@"nsws: error %@", error);
}



- (void)webSocket:(SRWebSocket * )webSocket didCloseWithCode:(NSInteger)code reason:(NSString * )reason wasClean:(BOOL)wasClean {}


- (BOOL) isConnecting {
    if (m_state == STATE_CONNECTING) return true;
    return false;
}



- (void) close {
    [m_client close];
    m_state = STATE_CLOSED;
}

@end
