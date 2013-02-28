//
//  SUBAppDelegate.h
//  Subtilest
//
//  Created by Frederic Jacobs on 13/12/12.
//  Copyright (c) 2013 Frederic Jacobs & Romain Ruetschi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XMLRPC/XMLRPC.h>
#import "SUBPreferencesController.h"
#import "SUBMovieDropView.h"
#import "SUBHashAlgorithm.h"
#import "SUBSubtitleManager.h"

@interface SUBAppDelegate : NSObject <NSApplicationDelegate, OROpenSubtitleDownloaderDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet SUBMovieDropView *dropView;
@property (weak) IBOutlet NSTextField *statusField;
@property (strong) IBOutlet SUBPreferencesController *preferencesController;
@property (strong) SUBSubtitleManager *subtitleManager;

- (void)openSubtitlerDidLogIn:(OROpenSubtitleDownloader *)downloader;
- (void)fetchSubtitlesForFileAtPath: (NSString *)filePath;
- (IBAction)showPreferences:(id)sender;


@end
