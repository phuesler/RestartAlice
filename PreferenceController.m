//
//  PreferenceController.m
//  RestartAlice
//
//  Created by phuesler on 08.05.10.
//  Copyright 2010 huesler informatik. All rights reserved.
//

#import "PreferenceController.h"
#import "SDKeychain.h"

NSString * const RALUsernameKey = @"Username";
NSString * const RALRouterURLKey = @"RouterURL";

@implementation PreferenceController

@synthesize passwordField, routerURLField;

+ (void) initialize {
  NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
  [defaultValues setObject:@"http://192.168.1.1" forKey:RALRouterURLKey];
  [defaultValues setObject:@"admin" forKey:RALUsernameKey];
  [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
}

- (id)init{
  if(![super initWithWindowNibName:@"Preferences"]){
    return nil;
  }
  return self;
}

- (void) windowDidLoad{
  [routerURLField setStringValue:[self getRouterURL]];
}

- (NSString *) getRouterURL{
  return [[NSUserDefaults standardUserDefaults] stringForKey:RALRouterURLKey];
}

- (NSString *) getUsername{
  return [[NSUserDefaults standardUserDefaults] stringForKey:RALUsernameKey];
}

-(NSString *) getPassword {
  	return [SDKeychain securePasswordForIdentifier: [self getUsername]];
}


-(IBAction) changePassword: (id) sender {
  [SDKeychain setSecurePassword:[passwordField stringValue] forIdentifier: [self getUsername]];
}

-(IBAction) changeRouterURL: (id) sender {
  [[NSUserDefaults standardUserDefaults] setObject:[routerURLField stringValue] forKey: @"RouterURL"];
}
@end
