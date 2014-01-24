//
//  secondView.h
//  planner
//
//  Created by Howard Livingston on 1/22/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol secondViewDelegate <NSObject>


@required

-(void)sendPlan:(NSString *)savedPlanString;


@end 


@interface secondView : UIViewController <UITextFieldDelegate> 



{
    NSString *dateString;
    NSString *savedPlanString;
    
    
    id<secondViewDelegate> customDelegate;
    
    
    
    IBOutlet UITextField * text;
    IBOutlet UIDatePicker *datePicker;
 
 
 
 }

@property (strong) id <secondViewDelegate> customDelegate;


-(IBAction)onClick:(UIButton *)sender;
-(IBAction)getDate:(UIDatePicker *)sender;
-(IBAction)saveNewPlan:(UIButton *)sender;
@end


