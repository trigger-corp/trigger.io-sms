//
//  sms_API.m
//  Forge
//
//  Created by Connor Dunn on 14/03/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import "sms_API.h"
#import "sms_Delegate.h"

@implementation sms_API

+ (void)send:(ForgeTask*)task to:(NSArray*)to body:(NSString*)body {
	MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
	if ([MFMessageComposeViewController canSendText]) {
		sms_Delegate *delegate = [[sms_Delegate alloc] initWithTask:task];
		controller.messageComposeDelegate = delegate;
		controller.body = body;
		controller.recipients = to;
		[[[ForgeApp sharedApp] viewController] presentModalViewController:controller animated:YES];
	} else {
		[task error:@"SMS not available" type:@"UNAVAILABLE" subtype:nil];
	}
}

@end
