//
//  AppDelegate.h
//  PantominePop
//
//  Created by Wang Lihui on 12-12-18.
//  Copyright (c) 2012年 Wang Lihui. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Pantomime/Pantomime.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    CWPOP3Store *_pop3;
    //CWSMTP *_smtp;
}

@property (strong, nonatomic) UIWindow *window;

@end
