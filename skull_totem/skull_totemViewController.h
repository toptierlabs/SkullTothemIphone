//
//  skull_totemViewController.h
//  skull_totem
//
//  Created by TopTier on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface skull_totemViewController : UIViewController {
    NSDictionary *texts;
    NSArray   *textkeys;
    NSMutableArray   *randomTextkeys;
    
    NSDictionary *images;
    NSArray   *imagekeys;
    NSMutableArray   *randomImagekeys;
    
    NSInteger currentIterator;
    NSTimer *currentTimer;
    
    IBOutlet UIImageView *imgView;
    IBOutlet UILabel *labelView;
}

//Texts stuff
@property (nonatomic,retain) NSDictionary *texts;
@property (nonatomic,retain) NSArray   *textkeys;
@property (nonatomic,retain) NSMutableArray   *randomTextkeys;


//Image stuff
@property (nonatomic,retain) NSDictionary *images;
@property (nonatomic,retain) NSArray   *imagekeys;
@property (nonatomic,retain) NSMutableArray   *randomImagekeys;

//Counter and Timer
@property (nonatomic) NSInteger currentIterator;
@property (nonatomic,retain) NSTimer *currentTimer;

//Views (Label and Image)
@property (nonatomic,retain) UILabel *labelView;
@property (nonatomic,retain) UIImageView   *imgView;


-(void) restart;

@end
