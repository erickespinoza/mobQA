//
//  EditViewController.h
//  MobQA
//
//  Created by Erick Espinoza on 12/15/13.
//  Copyright (c) 2013 Erick Espinoza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URLViewController.h"

@interface EditViewController : UIViewController
@property (strong, nonatomic) URLViewController *urlViewController;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *url;
@end
