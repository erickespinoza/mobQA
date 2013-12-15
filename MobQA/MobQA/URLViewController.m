//
//  URLViewController.m
//  MobQA
//
//  Created by Erick Espinoza on 12/15/13.
//  Copyright (c) 2013 Erick Espinoza. All rights reserved.
//

#import "URLViewController.h"
#import "EditViewController.h"
#import "EEWebViewController.h"

@interface URLViewController ()

@end

@implementation URLViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.urlElements = [[NSMutableArray alloc]init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"UrlToReview"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"user" equalTo:user];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [self.urlElements addObjectsFromArray:objects];
            NSLog(@"Successfully Obtain %i urls",objects.count);
            [self.tableView reloadData];
        }else{
            NSLog(@"Error: %@",error);
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.urlElements.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if ((indexPath.row%2)==0) {
        CellIdentifier = [NSString stringWithFormat:@"%@%@",CellIdentifier,@"Even"];
    }
    PFObject *url = [self.urlElements objectAtIndex:indexPath.row];
    cell.textLabel.text = url[@"name"];
    cell.detailTextLabel.text = url[@"url"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        PFQuery *query = [PFQuery queryWithClassName:@"UrlToReview"];
        PFObject *element = [self.urlElements objectAtIndex:indexPath.row];
        [query whereKey:@"name" equalTo:element[@"name"]];
        [query whereKey:@"user" equalTo:element[@"user"]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
            if (!error) {
                NSLog(@"Delete: %u objects",objects.count);
                for (PFObject *object in objects) {
                    [object deleteInBackground];
                }
            }
        }];
        [self.urlElements removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"edit"]) {
        EditViewController *editViewController = [segue destinationViewController];
        editViewController.urlViewController = self;
    }
    
    if ([segue.identifier isEqualToString:@"web"]) {
        EEWebViewController *webViewController = [segue destinationViewController];
        PFObject *object = [self.urlElements objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        webViewController.name = object[@"name"];
        webViewController.url = object[@"url"];
    }
}



@end
