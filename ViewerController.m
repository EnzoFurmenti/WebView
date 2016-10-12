//
//  ViewerController.m
//  WebView
//
//  Created by EnzoF on 12.10.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "ViewerController.h"

@interface ViewerController()<UIWebViewDelegate>

@property(nonatomic,strong) UIApplication *aplication;
@end

@implementation ViewerController


-(void)loadView{
    [super loadView];
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [self refreshButtons];
    
     self.aplication = [UIApplication sharedApplication];
    [self.viewer loadRequest:self.request];
    self.viewer.scalesPageToFit = YES;
    self.viewer.paginationMode = UIWebPaginationModeTopToBottom;
}

-(void)dealloc{
    self.aplication.networkActivityIndicatorVisible = NO;
}

#pragma  mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView{
    self.aplication.networkActivityIndicatorVisible = YES;
    NSLog(@"start");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.aplication.networkActivityIndicatorVisible = NO;
    [self refreshButtons];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    self.aplication.networkActivityIndicatorVisible = NO;
    NSLog(@"%@",[error localizedDescription]);
    [self refreshButtons];
}

#pragma mark - metods

-(void)refreshButtons{
    self.back.enabled = [self.viewer canGoBack];
    self.forward.enabled = [self.viewer canGoForward];
}

#pragma mark - action

- (IBAction)actionBackBarButton:(UIBarButtonItem *)sender {
    if([self.viewer canGoBack])
    {
        [self.viewer stopLoading];
        [self.viewer goBack];
    }
    
}

- (IBAction)actionForwardBarButton:(UIBarButtonItem *)sender {
    if([self.viewer canGoForward])
    {
        [self.viewer stopLoading];
        [self.viewer goForward];
    }
}

- (IBAction)actionRefreshBarButton:(UIBarButtonItem *)sender {
    [self.viewer stopLoading];
    [self.viewer reload];
}

@end
