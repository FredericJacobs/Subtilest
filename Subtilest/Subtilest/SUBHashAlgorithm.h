//
//  SUBHashAlgorithm.h
//  Subtilest
//
//  Created by Frederic Jacobs on 13/12/12.
//  Copyright (c) 2012 Frederic Jacobs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct
{
	uint64_t fileHash;
	uint64_t fileSize;
} VideoHash;

@interface SUBHashAlgorithm : NSObject {
    
}
+(VideoHash)hashForPath:(NSString*)path;
+(VideoHash)hashForURL:(NSURL*)url;
+(VideoHash)hashForFile:(NSFileHandle*)handle;
+(NSString*)stringForHash:(uint64_t)hash;


@end
