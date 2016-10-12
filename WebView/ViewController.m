//
//  ViewController.m
//  WebView
//
//  Created by EnzoF on 10.10.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "ViewController.h"
#import "ViewerController.h"

@interface ViewController ()<UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"accessory");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([sender isKindOfClass:[UITableViewCell class]])
    {
        NSURL *url;
        NSURLRequest *request;
        UITableViewCell *cell = (UITableViewCell*)sender;
        if([segue.destinationViewController isKindOfClass:[ViewerController class]])
        {
            ViewerController *viewerC = (ViewerController*)segue.destinationViewController;
            if([cell.reuseIdentifier isEqualToString: @"pdfCell"])
            {
                NSString *filePath = [[NSBundle mainBundle] pathForResource:cell.textLabel.text ofType:@"pdf"];
                url = [NSURL fileURLWithPath:filePath];
                request = [NSURLRequest requestWithURL:url];
                viewerC.navigationItem.title = @"PDF";
            }
            else{
                
                url = [NSURL URLWithString:cell.textLabel.text];
                request = [NSURLRequest requestWithURL:url];
                viewerC.navigationItem.title = @"URL";
            }
            
            viewerC.request = request;
        }
    }
}

@end
