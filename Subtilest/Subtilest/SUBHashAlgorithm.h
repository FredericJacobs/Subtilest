//
//  SUBHashAlgorithm.h
//  Subtilest
//
//  Created by Frederic Jacobs on 13/12/12.
//  Copyright (c) 2013 Frederic Jacobs & Romain Ruetschi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct
{
	uint64_t fileHash;
	uint64_t fileSize;
} SUBVideoHash;

@interface SUBHashAlgorithm : NSObject {
    
}
+(SUBVideoHash)hashForPath:(NSString*)path;
+(SUBVideoHash)hashForURL:(NSURL*)url;
+(SUBVideoHash)hashForFile:(NSFileHandle*)handle;
+(NSString*)stringForHash:(uint64_t)hash;


@end
