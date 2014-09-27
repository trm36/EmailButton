//
//  EBMailButtonViewController.m
//  EmailButton
//
//  Created by Joshua Howland on 6/5/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "EBMailButtonViewController.h"
#import <MessageUI/MessageUI.h>

@interface EBMailButtonViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation EBMailButtonViewController

- (IBAction)sendEmail:(id)sender
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        
        //mail is a view controller with a delegate
        //therefore to get to the actual delegate we want
        //we must use mailComposeDelegate
        mailViewController.mailComposeDelegate = self;
        
        [mailViewController setSubject:@"An Awesome Email"];
        [mailViewController setMessageBody:@"Here is the body for my message." isHTML:NO];
        
        //can run code (block) when view controller is presented (completed)
        [self presentViewController:mailViewController animated:NO completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
