//
//  OptionsViewController.m
//  skull_totem
//
//  Created by TopTier on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OptionsViewController.h"
#import "skull_totemAppDelegate.h"

@implementation OptionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

//Repeat button event 
- (IBAction) restart:(id)sender {
    //Calling AppDelegate to switch views
    skull_totemAppDelegate *appDelegate= (skull_totemAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate  openSkullView];

}

//Exit button event 
- (IBAction) exit:(id)sender {
    exit(0); //Exit Application
    
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
