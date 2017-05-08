# Paypalize - Demo app for Native XO and Popup Bridge SDK

This app can be used to test how a checkout flow opened inside a WebView (e.g. in hybrid apps) behaves when the WebView is "enhanced" with one of the two SDKs:
* [NativeXO SDK](https://github.com/paypal/paypalnativecheckout-docs/blob/master/ios.md) for Direct and [PayPal Checkout](https://github.com/paypal/paypal-checkout) implementations
* [Popup Bridge](https://github.com/braintree/popup-bridge-ios) SDK for Braintree Web implementations

## Installation

You can explore the code of the app to look at a potential implementation of these two SDKs, or you can download the app and execute in your iPhone.
To do so, just navigate to https://ppxoab.herokuapp.com/sdktester with your mobile browser, tap on the install icon and select "Install".

Before executing the app, you will need to "Trust" the developer team. To do so, navigate on your iPhone to:

>Settings -> General -> Device Management -> PayPal UK Ltd -> Trust "PayPal UK Ltd" -> Trust

You will now be able to execute Paypalize just by tapping on the app icon from your home screen.

## Usage

The only steps required to test a live website are:

1. select the SDK you want to test, based on the implementation of the webpage
2. type the url you want to open
3. tap on "Load page" to open the page inside a WebView "enhanced" with the selected SDK
4. test the checkout process. The transaction should complete correctly without any change on both the web page and server side
