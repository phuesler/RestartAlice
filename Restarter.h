//
//  Restarter.h
//  RestartAlice
//
//  Created by phuesler on 08.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import <Cocoa/Cocoa.h>

enum {
  AliceConnect = 0,
  AliceDisconnect = 1
};
typedef int AliceConnectionAction;


@interface Restarter : NSObject {
  NSString *password;
  NSString *routerURL;
  NSURL *loginURL;
}
+ (Restarter *) restartConnection:(NSString *) routerURL password: (NSString *) password;
- (id) initWithURL: (NSString *) _url andPassword: (NSString *) _password;
-(void) run;
-(bool) login;
-(bool) connectDSL;
-(bool) disconnectDSL;
-(bool) reconnect:(AliceConnectionAction)connectNowValue;
-(bool) runRequest:(NSURLRequest *)request;

@end
