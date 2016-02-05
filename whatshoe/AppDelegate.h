//
//  AppDelegate.h
//  whatshoe
//
//  Created by whatshoe on 2015. 10. 27..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import <Google/CloudMessaging.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GGLInstanceIDDelegate, GCMReceiverDelegate>

@property(nonatomic, strong) UIWindow *window;
@property(nonatomic, readonly, strong) NSString *registrationKey;
@property(nonatomic, readonly, strong) NSString *messageKey;
@property(nonatomic, readonly, strong) NSString *gcmSenderID;
@property(nonatomic, readonly, strong) NSDictionary *registrationOptions;

@property (nonatomic, assign) BOOL isPopup;
@property (nonatomic, assign) BOOL isNickNameHTTP;
@end

