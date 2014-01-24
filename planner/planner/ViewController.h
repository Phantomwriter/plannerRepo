//
//  ViewController.h
//  planner
//
//  Created by Howard Livingston on 1/22/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "secondView.h"

@interface ViewController : UIViewController <secondViewDelegate>




//Main View Box---Displays added events
{
    IBOutlet UITextView *planListText;
    
    NSString * planListString;

}






@end
