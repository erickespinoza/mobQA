//
//  EEWebViewController.h
//  MobQA
//
//  Created by Erick Espinoza on 12/15/13.
//  Copyright (c) 2013 Erick Espinoza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EEWebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *url;
@end
