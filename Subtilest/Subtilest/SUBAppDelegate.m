//
//  SUBAppDelegate.m
//  Subtilest
//
//  Created by Frederic Jacobs on 13/12/12.
//  Copyright (c) 2012 Frederic Jacobs. All rights reserved.
//

#import <OROpenSubtitleDownloader.h>
#import "SUBAppDelegate.h"
#import "SUBHashAlgorithm.h"
#import "SUBSubtitleManager.h"

@implementation SUBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Can't even instanciate the class yet, because it tries to login with OpenSubtitles.org and our app hasn't been submitted yet.
    // OROpenSubtitleDownloader *downloader = [[OROpenSubtitleDownloader alloc] init];
    // self.manager = [[SUBSubtitleManager alloc] initWithDownloader: downloader];
    
    self.dropView.callback = ^( NSURL *url ) {
        [self fetchSubtitlesForFilePath: url.path];
    };
}

- (BOOL)application: (NSApplication *)theApplication openFile: (NSString *)filePath
{
    [self fetchSubtitlesForFilePath: filePath];
    
    return TRUE;
}

- (void)fetchSubtitlesForFilePath: (NSString *)filePath
{
    SUBVideoHash hash = [SUBHashAlgorithm hashForPath: filePath];
    NSLog( @"File path: %@\nFile hash: %llu\nFile size: %llu", filePath, hash.fileHash, hash.fileSize );
}

- (IBAction)showPreferences:(id)sender
{
    if(self.preferencesController == nil) {
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
