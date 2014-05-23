//
//  sms_Delegate.m
//  Forge
//
//  Created by Connor Dunn on 14/03/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import "sms_Delegate.h"

@implementation sms_Delegate

- (sms_Delegate*) initWithTask:(ForgeTask*)initTask {
	if (self = [super init]) {
		me = self;
		task = initTask;
	}
	return self;
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
   	[[[ForgeApp sharedApp] viewController] dismissViewControllerHelper:^{
            if (result == MessageComposeResultSent) {
                [task success:nil];
            } else if (result == MessageComposeResultCancelled) {
                [task error:@"User cancelled SMS send" type:@"EXPECTED_FAILURE" subtype:nil];
            } else if (result == MessageComposeResultFailed) {
                [task error:@"SMS failed to send" type:@"UNEXPECTED_FAILURE" subtype:nil];
            } else {
                [task error:@"Unknown error sending SMS" type:@"UNAVAILABLE" subtype:nil];
            }
            me = nil;
        }];
}

@end
