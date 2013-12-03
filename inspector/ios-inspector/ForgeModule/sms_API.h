//
//  sms_API.h
//  Forge
//
//  Created by Connor Dunn on 14/03/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sms_API : NSObject

+ (void)send:(ForgeTask*)task to:(NSArray*)to body:(NSString*)body;

@end
