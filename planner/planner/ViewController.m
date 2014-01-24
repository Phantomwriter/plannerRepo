//
//  ViewController.m
//  planner
//
//  Created by Howard Livingston on 1/22/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import "ViewController.h"
#import "secondView.h"
@interface ViewController ()

@end

@implementation ViewController


//Main View To second View Segue




-(void)sendPlan:(NSString *)savedPlanString

{


    if (planListString != nil)
    {
        planListString = [planListString stringByAppendingString:planListString];
    }
    // First event added to the list
    else
    {
        planListString = [NSString stringWithFormat:@"%@",planListString];
    }
    planListText.text = planListString;
}


- (void)viewDidLoad
{
    
    planListText.text = @"Make some plans";
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Add Plan"])
    {
        secondView *addPlanView = segue.destinationViewController;
        addPlanView.customDelegate = self;
    }
}

















@end
