//
//  SUBSubtitlesManager.m
//  Subtilest
//
//  Created by Romain Ruetschi on 26.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import "SUBSubtitleManager.h"
#import "SUBHashAlgorithm.h"
#import "SUBPreferences.h"

@implementation SUBSubtitleManager

- (SUBSubtitleManager *)initWithDownloader: (OROpenSubtitleDownloader *) downloader
{
    if( self = [super init] ) {
        self.downloader = downloader;
    }

    return self;
}

- (void)fetchSubtitleForMovieAtPath: (NSString *)moviePath withCallback: (SUBManagerFetchCallback)callback
{
    SUBVideoHash hash = [SUBHashAlgorithm hashForPath: moviePath];
    NSString *hashString = [NSString stringWithFormat: @"%0llx", hash.fileHash];
    NSNumber *fileSize = [NSNumber numberWithUnsignedLongLong: hash.fileSize];

    self.downloader.languageString = [[SUBPreferences sharedInstance] subtitlesLanguage];
    [self.downloader searchForSubtitlesWithHash: hashString andFilesize: fileSize: ^(NSArray *subtitles) {
        for( OpenSubtitleSearchResult *subtitle in subtitles ) {
            NSLog( @"--------------------------------------------------------------------------" );
            NSLog( @"ID:       %@", subtitle.subtitleID );
            NSLog( @"Language: %@", subtitle.subtitleLanguage );
            NSLog( @"ISO-639:  %@", subtitle.iso639Language );
            NSLog( @"Download: %@", subtitle.subtitleDownloadAddress );
        }

        if( !subtitles.count ) {
            return;
        }
        
        NSString *path = [self subtitlePathForMovieAtPath: moviePath withSubtitle: subtitles[0]];
        [self.downloader downloadSubtitlesForResult: subtitles[0] toPath: path : ^(void) {
            NSLog( @"Done." );
            dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), callback );
        }];
    }];
}

- (NSString *)subtitlePathForMovieAtPath: (NSString *)moviePath withSubtitle: (OpenSubtitleSearchResult *)subtitle
{
    if( [[SUBPreferences sharedInstance] shouldRenameSubtitles] ) {
        return [NSString stringWithFormat: @"%@.srt", [moviePath stringByDeletingPathExtension]];
    }
    
    return [NSString stringWithFormat: @"%@/%@.srt", [moviePath stringByDeletingLastPathComponent], subtitle.subtitleID];
}

- (void)debugState
{
    switch( self.downloader.state ) {
        case OROpenSubtitleStateLoggingIn:
            NSLog( @"State: OROpenSubtitleStateLoggingIn" );
            break;
        case OROpenSubtitleStateLoggedIn:
            NSLog( @"State: OROpenSubtitleStateLoggedIn" );
            break;
        case OROpenSubtitleStateSearching:
            NSLog( @"State: OROpenSubtitleStateSearching" );
            break;
        case OROpenSubtitleStateDownloading:
            NSLog( @"State: OROpenSubtitleStateDownloading" );
            break;
        case OROpenSubtitleStateDownloaded:
            NSLog( @"State: OROpenSubtitleStateDownloaded" );
            break;
    }
}

@end
