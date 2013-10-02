//
//  AppDelegate.h
//  nsws
//
//  Created by sassembla on 2013/10/02.
//  Copyright (c) 2013年 sassembla. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SRWebSocket.h"

#define KEY_TARGET  (@"-t")
#define KEY_MESSAGE (@"-m")

enum STATE {
    STATE_NONE,
    STATE_CONNECTING,
    STATE_CONNECTED,
    STATE_CLOSED,
    STATE_FAILEDTOCONNECT
};

@interface AppDelegate : NSObject <NSApplicationDelegate, SRWebSocketDelegate>

@property (assign) IBOutlet NSWindow *window;

- (id) initAppDelegateWithParam:(NSDictionary * )dict;

- (BOOL) isConnecting;
- (long) messageCount;

- (void) close;
@end
