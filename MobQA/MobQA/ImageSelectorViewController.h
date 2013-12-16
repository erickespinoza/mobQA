//
//  ImageSelectorViewController.h
//  MobQA
//
//  Created by Erick Espinoza on 12/15/13.
//  Copyright (c) 2013 Erick Espinoza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageSelectorViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *imageSelected;
@property (strong, nonatomic) UIImagePickerController *pickerController;
- (IBAction)chooseImage:(id)sender;
@end
