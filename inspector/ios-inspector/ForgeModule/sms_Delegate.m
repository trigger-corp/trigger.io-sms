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
		[task success:nil];
		me = nil;
	}];
}

@end
