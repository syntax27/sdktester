# SDK Tester - Demo app for Native XO and Popup Bridge SDK

This app can be used to test how a PayPal checkout flow opened inside a WebView (e.g. in hybrid apps) behaves when the WebView is "enhanced" with one of the two SDKs:
* [NativeXO SDK](https://github.com/paypal/paypalnativecheckout-docs/blob/master/ios.md) for Direct and [PayPal Checkout](https://github.com/paypal/paypal-checkout) implementations
* [Popup Bridge SDK](https://github.com/braintree/popup-bridge-ios) for Braintree Web implementations

## Installation

You can explore the code of the app to look at a potential implementation of these two SDKs. To install the app, you need Xcode to compile it.

## Usage

The only steps required to test a live website are:

1. select the SDK you want to test, based on the implementation of the webpage
2. type the url you want to open
3. tap on "Load page" to open the page inside a WebView "enhanced" with the selected SDK
4. test the checkout process. The transaction should complete correctly without any change on both the web page and server side

![App Screenshot](https://github.com/andreabondi/sdktester/blob/master/Images/sdkTester.png "Screenshot")
