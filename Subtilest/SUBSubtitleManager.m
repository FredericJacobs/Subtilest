//
//  SUBSubtitlesManager.m
//  Subtilest
//
//  Created by Romain Ruetschi on 26.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import "SUBSubtitleManager.h"
#import "SUBHashAlgorithm.h"

@implementation SUBSubtitleManager

- (SUBSubtitleManager *)initWithDownloader: (OROpenSubtitleDownloader *) downloader
{
    if( self = [super init] ) {
        self.downloader = downloader;
    }

    [self debugState];

    return self;
}

- (void)fetchSubtitleForMovieAtPath: (NSString *)moviePath
{
    SUBVideoHash hash = [SUBHashAlgorithm hashForPath: moviePath];
    NSString *hashString = [NSString stringWithFormat: @"%0llx", hash.fileHash];
    NSNumber *fileSize = [NSNumber numberWithUnsignedLongLong: hash.fileSize];

    NSLog( @"File path: %@", moviePath );
    NSLog( @"File hash: %@", hashString );
    NSLog( @"File size: %@", fileSize );

    [self debugState];

    [self.downloader searchForSubtitlesWithHash: hashString andFilesize: fileSize: ^(NSArray *subtitles) {
        [self debugState];
        NSLog( @"%@", subtitles );
    }];

    [self debugState];
}

-(void)debugState
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
