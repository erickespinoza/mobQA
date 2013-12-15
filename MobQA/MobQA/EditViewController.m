//
//  EditViewController.m
//  MobQA
//
//  Created by Erick Espinoza on 12/15/13.
//  Copyright (c) 2013 Erick Espinoza. All rights reserved.
//

#import "EditViewController.h"


@interface EditViewController ()

@end

@implementation EditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Done:(id)sender{
    //add validation textfields
    if (self.name.text.length > 0 && self.url.text.length >0) {
        PFObject *new = [PFObject objectWithClassName:@"UrlToReview"];
        new[@"user"] = [PFUser currentUser];
        new[@"name"] = self.name.text;
        new[@"url"] = self.url.text;
        [self.urlViewController.urlElements addObject:new];
        [new saveInBackground];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successfully Added" message:@"Your new URL was succesfully added" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error on URl" message:@"Please verify your Name and URL information" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if (touch.phase == UITouchPhaseBegan) {
        NSLog(@"afuera");
        [self.name resignFirstResponder];
        [self.url resignFirstResponder];
    }
}

@end
