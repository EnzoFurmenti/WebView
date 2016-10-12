//
//  ViewerController.h
//  WebView
//
//  Created by EnzoF on 12.10.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewerController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *viewer;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;

- (IBAction)actionBackBarButton:(UIBarButtonItem *)sender;
- (IBAction)actionForwardBarButton:(UIBarButtonItem *)sender;
- (IBAction)actionRefreshBarButton:(UIBarButtonItem *)sender;




@property(nonatomic,strong) NSURLRequest *request;
@property(nonatomic,assign) BOOL isURL;




@end
