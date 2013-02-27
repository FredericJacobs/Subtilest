//
//  SUBAppDelegate.m
//  Subtilest
//
//  Created by Frederic Jacobs on 13/12/12.
//  Copyright (c) 2013 Frederic Jacobs & Romain Ruetschi. All rights reserved.
//

#import <OROpenSubtitleDownloader.h>
#import "SUBAppDelegate.h"
#import "SUBHashAlgorithm.h"
#import "SUBSubtitleManager.h"
#import "SUBPreferences.h"

@implementation SUBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    OROpenSubtitleDownloader *downloader = [[OROpenSubtitleDownloader alloc] init];
    downloader.delegate = self;
    
    self.dropView.callback = ^( NSURL *url ) {
        [self fetchSubtitlesForFileAtPath: url.path];
    };
}

- (void)openSubtitlerDidLogIn:(OROpenSubtitleDownloader *)downloader
{
    NSLog( @"OROpenSubtitleDownloader did log in." );
    self.subtitleManager = [[SUBSubtitleManager alloc] initWithDownloader: downloader];
}

- (BOOL)application: (NSApplication *)theApplication openFile: (NSString *)filePath
{
    [self fetchSubtitlesForFileAtPath: filePath];
    
    return TRUE;
}

- (void)fetchSubtitlesForFileAtPath: (NSString *)filePath
{
    self.subtitleManager.renameSubtitleFile = [[SUBPreferences sharedInstance] shouldRenameSubtitles];
    [self.subtitleManager fetchSubtitleForMovieAtPath: filePath];
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
