//
//  secondView.m
//  planner
//
//  Created by Howard Livingston on 1/22/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import "secondView.h"

@interface secondView ()

@end

@implementation secondView


@synthesize customDelegate;



//OnClick
//Close Keyboard
-(IBAction)onClick:(UIButton *)sender
{
    
    
    UIButton *button =(UIButton*)sender;
    if (button !=nil)
    {
        [text resignFirstResponder];
            
                
        
    }
    
     
}




//Save text field and date picker
-(IBAction)saveNewPlan:(UIButton *)sender
{
    
    if (sender != nil)
    {
        // Save button
        if (sender.tag == 1)
        {
            if (text.text.length == 0)
            {
                UIAlertView *planAlert = [[UIAlertView alloc]initWithTitle:@"Plan error" message:@"Add some plans." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [planAlert show];
            }
            // Alert displays if user didnt select a date and time
            else if (dateString == NULL)
            {
                UIAlertView *dateAlert = [[UIAlertView alloc]initWithTitle:@"Date Error" message:@"Pick a date and time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [dateAlert show];
            }
            else
            {
                
     ///problem lies here for week 3
                
                /*if (customDelegate != nil)
                {
                    
                    savedPlanString = [NSString stringWithFormat:@"%@ \n %@ \n \n",text.text, dateString];
                    
                    [self.customDelegate sendPlan:savedPlanString];*/
                
                    
                    // Dismisses the modal view
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }
        }
    }
    



/*[self.customDelegate appendNewEvent: text.text];
[self dismissViewControllerAnimated:YES completion:nil];*/


//Getting the date from the date picker
-(IBAction)getDate:(UIDatePicker *)sender
{
    if (sender != nil)
    {
        NSDate *dateSelected = sender.date;
        if (dateSelected != nil)
        {
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
            if (dateFormat != nil)
            {
                [dateFormat setDateFormat:@"EEE, MMM d, yyyy hh:mm a"];
                dateString = [dateFormat stringFromDate:dateSelected];
            }
        }
    }
}


//secondView Text field
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.text = @"";
    
    return true;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self dismissViewControllerAnimated:true completion:nil];
    return true;
    
}


- (void)viewDidLoad
{
    
    datePicker.minimumDate = [NSDate date];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}




- (void)viewWillAppear:(BOOL)animated
{
    
    //Captures original size of text view
    
    //Notify user when:
    //When the keyboard is about to be displayed
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector
     (keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    //Right before the keyboard goes away
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector
     (keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    [super viewWillAppear:animated];
    
}

-(void)keyboardWillShow:(NSNotification *)notification
{
    
    
     
     //If using phone..current app is iPad
     
     //width and height of the current keyboard
     CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
     
     CGRect newFrame = CGRectMake(0.0, text.frame.origin.y, 480.0f, text.frame.size.height - keyboardSize.height);
     
     [text setFrame:newFrame];
     
     
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
