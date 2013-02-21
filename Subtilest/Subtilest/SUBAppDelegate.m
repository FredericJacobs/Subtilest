//
//  SUBAppDelegate.m
//  Subtilest
//
//  Created by Frederic Jacobs on 13/12/12.
//  Copyright (c) 2012 Frederic Jacobs. All rights reserved.
//

#import "SUBAppDelegate.h"
#import "SUBHashAlgorithm.h"
#import <XMLRPC/XMLRPC.h>

@implementation SUBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename{
    NSLog(@"%llu",[SUBHashAlgorithm hashForPath:filename].fileHash);
    
    
    NSURL *URL = [NSURL URLWithString: @"http://api.opensubtitles.org/xml-rpc"];
    XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithURL: URL];
    XMLRPCConnectionManager *manager = [XMLRPCConnectionManager sharedManager];
    
    [request setMethod:@"LogIn" withParameters:[NSArray arrayWithObjects:@"", @"", @"", @"OS Test User Agent", nil]];
    
    NSLog(@"Request body: %@", [request body]);
    
    [manager spawnConnectionWithXMLRPCRequest: request delegate: self];
    
    return TRUE;
}
- (BOOL)request:(XMLRPCRequest *)request canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace{
    return TRUE;
}

- (void)request:(XMLRPCRequest *)request didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    
}

- (void)request:(XMLRPCRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"%@",error);
}

- (void) request:(XMLRPCRequest *)request didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    
}

- (void)request:(XMLRPCRequest *)request didReceiveResponse:(XMLRPCResponse *)response{
    
}

- (void) request:(XMLRPCRequest *)request didSendBodyData:(float)percent{
    
}

- (IBAction)showPreferences:(id)sender
{
    if (self.preferencesController == nil) {
        self.preferencesController = [[SUBPreferencesController alloc] initWithWindowNibName: @"Preferences"];
    }

    [self.preferencesController showWindow: nil];

     /*NSWindow *prefsWindow = self.preferencesController.window;

    [NSApp beginSheet: prefsWindow
       modalForWindow: self.window
        modalDelegate: self
       didEndSelector: @selector(didEndMySheet:returnCode:contextInfo:)
          contextInfo: nil];*/
}

@end
