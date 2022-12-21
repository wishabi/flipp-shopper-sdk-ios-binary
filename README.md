# FlippShopperSDK
FlippShopperSDK is a framework, that should provide a native-x experience to the clients.

## Getting started
There are several main features and functionalities that FlippShopperSDK provides. They are as follows:
- Rendering a native-x experience using `FPWebView`
- Providing delegate methods to handle `FPWebView` events

## Installation
### Swift Package Manager
Use this repo URL as the package URL and select the SFML package when prompted. You may have to add your GitHub credentials to Xcode.
### Manually
Link FlippShopperSDK.xcframework to your project by adding it under Linked Frameworks and Libraries. You may also need to add it under Embedded Binaries (if using the standalone binary).

## Quick start
To use the SDK, it's required to call the `FlippShopperSDK` configure method with the environment, siteId, and zoneIds passed as arguments, for example
`FPShopperSDK.shared.configure(.dev, siteId: "111", zoneIds: ["222"])` where
- environment - is the environment you'd like the SDK to work against
- siteId - represents SDK client, Use value provided by Flipp
- zoneIds - an array of geographical areas that includes or excludes certain flights and creatives. Use values provided by Flipp.
- userId - an optional property uniquely identifying the current user.

#### Creating an instance of `FPWebView`
```
class ViewController: UIViewController, NativeXDelegate {
  private var webView: FPWebView?
  
      override func viewDidLoad() {
        super.viewDidLoad()
        // Create an instance of FPWebView and pass a UIViewController containing it
        webview = FPWebView(viewController: self, features: [.addToList])
        // Assign a delegate
        webview.nativeXdelegate = self
      }
}
```
`FPWebView` requires several parameters:
- `viewController` - current `UIViewController`, containing the webview
- `features` - an optional array of features you'd like to have. By default - empty.
- `shouldAutosize` - optional property, which allows creating a manual or autosizing webview

## Features
You can pass additional features during FPWebView initialization using the parameter `features`, which expects an array of an enum. Currently, there are two supported features: 
1. goToURL - Supported by default. Ability to open a native browser from the SDK if, for example, the user clicks the URL.
2. addToList - Optional. Ability to add items from the FPWebView to your list. Implement func didTap(item: String)  delegate method if you want to handle the user taps.

## Size modes
The SDK supports automatic and manual sizing modes for `FPWebView`. During initialization, you can select the mode by passing the boolean variable `shouldAutosize`.

### Automatic

Default mode. Сhanges the webview frame based on the content height. For example, if by clicking a button, the webview expands, then using the automatic sizing, its height will also increase.

### Manual

You can enable the manual mode by passing `false` to `shouldAutosize` during the initialization.

Manual mode is more flexible in comparison to auto mode. The `FPWebView` will behave as a webview without frame change behavior. So in the same example, if by clicking a button, the webview expands, you should change the webview height yourself. You can get the actual content height from the delegate methods:

`func didResize(to height: Double)  or\and func didFinishLoad(contentHeight: Double)`

## Delegate methods
You can handle `FPWebView` events by assigning a delegate to `nativeXdelegate` property. 
The following events are supported:

`func didFinishLoad(contentHeight: Double)` - Called when the webview finished loading and the content is ready to be displayed.

`func didFailToLoad(error: Error)` - Webview failed to load

`func didResize(to height: Double)` - An optional method you can implement if you want to handle the webview size manually.

`func didTap(item: String)` - This method can be called if you declared support for .addToList feature during the webview initialization. Called when the user taps on add to list button in the view.