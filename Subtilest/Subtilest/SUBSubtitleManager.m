//
//  SUBSubtitlesManager.m
//  Subtilest
//
//  Created by Romain Ruetschi on 26.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import "SUBSubtitleManager.h"

@implementation SUBSubtitleManager

- (SUBSubtitleManager *)initWithDownloader: (OROpenSubtitleDownloader *) downloader
{
    if( self = [super init] ) {
        self.downloader = downloader;
    }
    
    return self;
}

- (void)fetchSubtitlesForHash: (SUBVideoHash)hash
{
    
}

@end
