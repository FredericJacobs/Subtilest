//
//  SUBPreferences.h
//  Subtilest
//
//  Created by Romain Ruetschi on 21.02.13.
//  Copyright (c) 2013 Frederic Jacobs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SUBPreferences : NSObject

+ (id)sharedInstance;
- (void)setSubtitlesLanguage: (NSString *)languageISOCode;
- (NSString *)subtitlesLanguage;

@end
