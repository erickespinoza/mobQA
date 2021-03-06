//
//  URLViewController.h
//  MobQA
//
//  Created by Erick Espinoza on 12/15/13.
//  Copyright (c) 2013 Erick Espinoza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URLViewController : UITableViewController<UISearchBarDelegate>
@property (strong, nonatomic) NSMutableArray *urlElements;
@property (strong, nonatomic) NSMutableArray *searchElements;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@end
