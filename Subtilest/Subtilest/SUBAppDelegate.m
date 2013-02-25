//
//  SUBAppDelegate.m
//  Subtilest
//
//  Created by Frederic Jacobs on 13/12/12.
//  Copyright (c) 2012 Frederic Jacobs. All rights reserved.
//

#import "SUBAppDelegate.h"
#import "SUBHashAlgorithm.h"

@implementation SUBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename{
    NSLog(@"%llu",[SUBHashAlgorithm hashForPath:filename].fileHash);
    
    return TRUE;
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
