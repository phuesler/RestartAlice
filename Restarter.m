//
//  Restarter.m
//  RestartAlice
//
//  Created by phuesler on 08.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import "Restarter.h"


@implementation Restarter

+ (Restarter *) restartConnection:(NSString *) routerURL password: (NSString *) password {
  Restarter *restarter = [[Restarter alloc] initWithURL: routerURL andPassword: password];
  [NSThread detachNewThreadSelector:@selector(run) toTarget:restarter withObject:nil];
  return restarter;
}

- (id) initWithURL: (NSString *) _routerURL andPassword: (NSString *) _password {
  if(![super init])
  {
    return nil;
  }
  
  password = _password;
  routerURL = _routerURL;
  loginURL = [NSURL URLWithString: [[NSString alloc] initWithFormat:@"%@/alicelogin", routerURL]];
  return self;
}

- (bool) runRequest: (NSURLRequest *)request {
  NSLog(@"%@", @"run request");
  NSURLResponse * response;
  NSError * error;
  NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
  if (!data) {
    return false;
  }
  else{
    return true;
  }
}

-(bool) login {
  NSMutableURLRequest *loginRequest = [NSMutableURLRequest requestWithURL:loginURL];
  [loginRequest setHTTPMethod:@"POST"];
  [loginRequest addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];  
  [loginRequest addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  NSString *requestBody = [[NSString alloc] initWithFormat:@"loginUserName=admin&loginPassword=%@", password];
  
  [loginRequest setHTTPBody:[requestBody dataUsingEncoding:NSASCIIStringEncoding]];
  return [self runRequest:loginRequest];
}

-(bool) reconnect:(AliceConnectionAction)connectNowValue{
  NSURL *url = [NSURL URLWithString: [
                [NSString alloc] 
                initWithFormat:@"%@/pppctrl.cmd?"
                @"action=infoconnect&conId=1&vpi=1&vci=32&portId%20=%200&"
                @"connectNow=%d",
                routerURL,
                connectNowValue]
                ];
  return [self runRequest: [NSURLRequest requestWithURL:url] ];
  
}

- (bool) disconnectDSL {
  return [self reconnect:AliceDisconnect];
}

- (bool) connectDSL {
  return [self reconnect:AliceConnect];
}

-(void) run {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  if ([self login] && [self disconnectDSL] && [self connectDSL])
  {
    NSLog(@"%@", @"ok");
  }
  else {
    NSLog(@"%@", @"not ok");
  }
  [pool release]; 
}

-(void) dealloc {
  [password release];
  [routerURL release];
  [loginURL release];
  [super dealloc];
}

@end
