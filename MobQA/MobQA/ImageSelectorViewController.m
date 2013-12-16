//
//  ImageSelectorViewController.m
//  MobQA
//
//  Created by Erick Espinoza on 12/15/13.
//  Copyright (c) 2013 Erick Espinoza. All rights reserved.
//

#import "ImageSelectorViewController.h"

@interface ImageSelectorViewController ()

@end

@implementation ImageSelectorViewController

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
    self.pickerController = [[UIImagePickerController alloc] init];
    self.pickerController.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chooseImage:(id)sender {
    [self presentViewController:self.pickerController animated:YES completion:NULL];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    self.imageSelected = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = self.imageSelected;
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
