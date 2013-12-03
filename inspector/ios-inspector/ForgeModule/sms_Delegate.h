//
//  sms_Delegate.h
//  Forge
//
//  Created by Connor Dunn on 14/03/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@interface sms_Delegate : NSObject <MFMessageComposeViewControllerDelegate> {
	ForgeTask *task;
	sms_Delegate *me;
}

- (sms_Delegate*) initWithTask:(ForgeTask*)initTask;


@end
