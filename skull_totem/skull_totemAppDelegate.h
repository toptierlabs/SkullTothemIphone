//
//  skull_totemAppDelegate.h
//  skull_totem
//
//  Created by TopTier on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class skull_totemViewController;
@class OptionsViewController;

@interface skull_totemAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    skull_totemViewController *viewController;
    OptionsViewController *optionsViewController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
//Skulls View
@property (nonatomic, retain) IBOutlet skull_totemViewController *viewController;

//Options view
@property (nonatomic, retain) IBOutlet OptionsViewController *optionsViewController;


//Event to switch to options view
-(void) openOptionsView;

//Event to switch to Skull view
-(void) openSkullView;

@end
