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

@protocol SUBSubtitleDownloader <NSObject>

@end

@interface SUBSubtitleManager : NSObject

@property (weak) OROpenSubtitleDownloader *downloader;

- (SUBSubtitleManager *)initWithDownloader: (OROpenSubtitleDownloader *) downloader;
- (void)fetchSubtitlesForHash: (SUBVideoHash)hash;

@end
