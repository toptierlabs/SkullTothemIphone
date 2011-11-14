//
//  skull_totemAppDelegate.h
//  skull_totem
//
//  Created by TopTier on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class skull_totemViewController;

@interface skull_totemAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet skull_totemViewController *viewController;

@end
