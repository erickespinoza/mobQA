//
//  WelcomeViewController.h
//  MobQA
//
//  Created by Erick Espinoza on 12/15/13.
//  Copyright (c) 2013 Erick Espinoza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (strong, nonatomic) IBOutlet UILabel *welcomeLabelBig;

@property (strong, nonatomic) PFLogInViewController *logInViewController;
@property (strong, nonatomic) PFSignUpViewController *signUpViewController;
- (IBAction)logOut:(id)sender;
@end
