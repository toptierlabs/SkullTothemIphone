		//
//  skull_totemViewController.m
//  skull_totem
//
//  Created by TopTier on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "skull_totemViewController.h"
#import "skull_totemAppDelegate.h"

@implementation skull_totemViewController

// texxts is a dictionary of texts to display, textkeys an array of keys and randomTextKeys is the same array of keys
// sorted randomly
@synthesize texts;
@synthesize textkeys;
@synthesize randomTextkeys;

// images is a dictionary of names of images, imagekeys an array of keys and randomImageKeys is the same array of
// keys sorted randomly
@synthesize images;
@synthesize imagekeys;
@synthesize randomImagekeys;

// Current iterator number, from 0 to the number of images to display
@synthesize currentIterator; 

//Image to display the skulls
@synthesize imgView;

//timer to switch the skulls
@synthesize currentTimer;

//Label that shows the random Text
@synthesize labelView;

- (void)dealloc
{
    [texts release];
    [textkeys release];
    [randomTextkeys release];
    
    [images release];
    [imagekeys release];
    [randomImagekeys release];
    [currentTimer release];

    
    [imgView release];
    [labelView release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

//This is the "sort" function that puts the items in random order.
//It uses a random number generator to decide the ordering of items in the array
NSInteger randomize(id num1, id num2, void *context)
{
	int rand = arc4random() %2;
	if (rand)
		return NSOrderedAscending;
    else 
        return NSOrderedDescending;
}



//This function populates "randomArray" with an array of indexes in random order.
//Once the getRandomWord method returns nil, call resetRandomArray to 
//repopulate the randomArray with the same list of words in a different random order.
- (void) resetRandomArray;
{
    //Copy over our starting "array" containing all our indexes in order.
	[randomTextkeys setArray: textkeys ];
    
    //Use a trick to "sort" the array into random order.
    //this trick involves using a sort function "randomize" that puts
    //the items in random order.
	[randomTextkeys sortUsingFunction: randomize context:NULL];
    
   	[randomImagekeys setArray: imagekeys ];
	[randomImagekeys sortUsingFunction: randomize context:NULL];
    
}


//This event is called on each timer tick. It loads a new image and increments the index counter.
//If the index counter reaches the image array size, it switches to the options view.
- (void)updateImage { 
    if (currentIterator == [randomImagekeys count])
    {
        //Invalidate timer.
        [currentTimer invalidate]; 
        //Reset counter
        currentIterator = 0;
        
        //Calls AppDelegate to switch views.
        skull_totemAppDelegate *appDelegate= (skull_totemAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate  openOptionsView];
    }
    else
    {
        // Get key to switch images
        NSString *key = [randomImagekeys objectAtIndex:currentIterator];
        
        // Get image from bundle
        UIImage *img = [UIImage imageWithContentsOfFile: 
                        [ [NSBundle mainBundle]  pathForResource:[images objectForKey: key]
                                                          ofType:@"jpeg"]];
	
        if (img != nil) { // Image was loaded successfully.
            [imgView setImage:img];
            [imgView setUserInteractionEnabled:NO];	
            
        }
    
        // Set label text
        [labelView setText:[texts objectForKey: [randomTextkeys objectAtIndex:currentIterator]]];
        
        currentIterator += 1;
	}
    


}

//Timer tick event
-(void) tickTimer
{
    //Calls an event in the main UI in order to update thread
    [self performSelectorOnMainThread:@selector(updateImage) withObject:nil waitUntilDone:false]; 
}


-(void) restart
{
    //Sort the array randomly
    [self resetRandomArray];
    
    //Reset counter
    currentIterator = 0;
    
    //Updates the image and start the timer each 10 seconds
    [self updateImage];
    currentTimer = [NSTimer  scheduledTimerWithTimeInterval:10 target:self selector:@selector(tickTimer) userInfo:nil repeats:YES];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //First load the text's array
    NSString *pathTexts = [[NSBundle mainBundle] pathForResource:@"texts" ofType:@"plist"];
    NSDictionary *dicTexts = [[NSDictionary alloc] initWithContentsOfFile:pathTexts];
    self.texts = dicTexts;
    self.textkeys = [dicTexts allKeys];
    
    //Load the images' names
    NSString *pathImages = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"plist"];
    NSDictionary *dicImages = [[NSDictionary alloc] initWithContentsOfFile:pathImages];
    self.images = dicImages;
    self.imagekeys = [dicImages allKeys];
    
    int imageArraySize = [imagekeys count];
    int textArraySize = [textkeys count];
    
    //init the random arrays
    self.randomImagekeys = [NSMutableArray arrayWithCapacity:imageArraySize];
    self.randomTextkeys = [NSMutableArray arrayWithCapacity:textArraySize];
    
    //Call the method to reset the presentation
    [self restart];
    
    
    //Free memory
    [dicTexts release];
    [dicImages release];

    
    [super viewDidLoad];
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
