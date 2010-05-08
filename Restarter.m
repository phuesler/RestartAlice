//
//  Restarter.m
//  RestartAlice
//
//  Created by phuesler on 08.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import "Restarter.h"


@implementation Restarter

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
  NSURL *url = [NSURL URLWithString:@"http://192.168.1.1/alicelogin"];  
  NSMutableURLRequest *loginRequest = [NSMutableURLRequest requestWithURL:url];
  [loginRequest setHTTPMethod:@"POST"];
  [loginRequest addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];  
  [loginRequest addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  NSString *requestBody = [[NSString alloc] 
                           initWithFormat:@"loginUserName=admin&loginPassword=%@", @"Q8sps0oBch"];
  
  [loginRequest setHTTPBody:[requestBody dataUsingEncoding:NSASCIIStringEncoding]];
  return [self runRequest:loginRequest];
}

-(bool) reconnect:(AliceConnectionAction)connectNowValue{
  NSURL *url = [NSURL URLWithString: [
                [NSString alloc] 
                initWithFormat:@"http://192.168.1.1/pppctrl.cmd?action=infoconnect&conId=1&vpi=1&vci=32&portId%20=%200&connectNow=%d",connectNowValue]
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

@end
