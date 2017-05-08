//
//  PYPLCheckout.h
//
//
//  Created by Poornima Venkatakrishnan on 3/21/16.
//  Copyright (c) 2014 Paypal. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@import SafariServices;

@interface PYPLCheckout : NSObject
    @property (strong, nonatomic) IBOutlet UIWebView *viewWeb;
    @property (strong, nonatomic) IBOutlet WKWebView *viewWKWeb;
    @property (strong, nonatomic) IBOutlet NSURL *urlscheme;
    @property (strong, nonatomic) IBOutlet NSURL *universallink;
    @property (strong, nonatomic) IBOutlet NSString *merchantId;
    @property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
    @property (strong, nonatomic) IBOutlet UIView *prevReactView;
    @property Boolean xojsEnabled;
    
    /*
     * sharedInstance: To initialize/get the singleton instance of paypal checkout sdk
     */
+ (id)sharedInstance;
    
       
    /*
     * init: Constructor for the paypal-xo singleton
     */
    
- (id)init;
    
    /*
     * setWebView: for the merchant to set the webview from the view controller.
     * This is the webview we want the paypal sdk to watch for checkout urls and put up the nativexo experience when appropriate
     */
- (void)setWebView: (UIWebView *)view;
    
    
    /*
     * setWKWebView: for the merchant to set the webview from the view controller.
     * This is the wkwebview we want the paypal sdk to watch for checkout urls and put up the nativexo experience when appropriate
     */
    
- (void)setWKWebView: (WKWebView *)view;
    
    /*
     * setupForXOJS: Required setup to support checkout js in the SDK
     *
     */
- (void) setupForXOJS;
    /*
     * setupSpinner: (UIView*) view
     */
- (void)_setupSpinner: (UIView*) view;
    
    /*
     * handleIfPPCheckout: this is the method that the merchant's view controller passes in the webview delegate to give an opportunity for handling paypal checkout specific urls.
     */
- (BOOL)handleIfPPCheckout: (NSURLRequest *) request;
    
    /*
     * openInWebView: Merchant's redirect url gets passed to the webview. On post payment or cancel payment, the urls get passed to the webview so that webview is put in an appropriate.
     */
- (void)openInWebView: (NSDictionary *) urls;
    
    /*
     * hideActivityIndicator: hides the spinner put up by the Paypal SDK
     */
    
- (void)hideActivityIndicator;
    
    /*
     * openURL: Merchant's app delegate function invokes this function to give the sdk an opportunity to handle the deep linking invocation.
     */
- (BOOL)openURL :(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
    
    /*
     * continueUserActivity: Merchant's app delegate function invokes this function to give the sdk an opportunity to handle the universal link invocation.
     */
- (BOOL)continueUserActivity :(UIApplication *)application userActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *))restorationHandler;
    
    /*
     * checkIfValidPPURL: To check if a given url is a valid Paypal checkout url.
     */
- (BOOL) checkIfValidPPURL:(NSURL *) url;
    
    /*
     * Private utility. Not for use externally.
     */
    
- (BOOL) _handleUrl: (NSURL*) url;
    
    /*
     * Private Utility. Not for use externally
     */
    
- (NSDictionary*) _parseQueryParam: (NSURL*) url;
    @end
