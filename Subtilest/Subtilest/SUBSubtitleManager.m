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
    
    return self;
}

- (void)fetchSubtitleForMovieAtPath: (NSString *)moviePath
{
    SUBVideoHash hash = [SUBHashAlgorithm hashForPath: moviePath];
    NSString *hashString = [NSString stringWithFormat: @"%llu", hash.fileHash];
    NSNumber *fileSize = [NSNumber numberWithUnsignedLongLong: hash.fileSize];
    
    NSLog( @"File path: %@", moviePath );
    NSLog( @"File hash: %llu", hash.fileHash );
    NSLog( @"File size: %llu", hash.fileSize );

    [self.downloader searchForSubtitlesWithHash: hashString andFilesize: fileSize: ^(NSArray *subtitles) {
        NSLog( @"%@", subtitles );
    }];
}

@end
