//
//  SUBSubtitlesManager.h
//  Subtilest
//
//  Created by Romain Ruetschi on 26.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OROpenSubtitleDownloader.h>
#import "SUBHashAlgorithm.h"

@interface SUBSubtitleManager : NSObject

typedef void (^SUBManagerFetchCallback)(void);

@property (strong) OROpenSubtitleDownloader *downloader;
@property BOOL renameSubtitleFile;

- (SUBSubtitleManager *)initWithDownloader: (OROpenSubtitleDownloader *) downloader;
- (void)fetchSubtitleForMovieAtPath: (NSString *)moviePath withCallback: (SUBManagerFetchCallback)callback;

@end
