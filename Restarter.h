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

}

- (void) run;

@end
