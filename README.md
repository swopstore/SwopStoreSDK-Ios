
# SwopStoreSDK


[![Version](https://img.shields.io/cocoapods/v/SwopStoreSDK.svg?style=flat)](https://cocoapods.org/pods/SwopStoreSDK)
[![License](https://img.shields.io/cocoapods/l/SwopStoreSDK.svg?style=flat)](https://cocoapods.org/pods/SwopStoreSDK)
[![Platform](https://img.shields.io/cocoapods/p/SwopStoreSDK.svg?style=flat)](https://cocoapods.org/pods/SwopStoreSDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


# How to integrate e-shop app via SDK

## iOS installation
URL https://github.com/swopstore/SwopStoreSDK-Ios 


SwopStoreSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
    pod 'SwopStoreSDK'
```


 
## Quick start
To start you need to get from SwopStore team two params: ShopId and BannerId.
At the beginning (before creating an order), initialize the SDK by using the initSDK(shopId : Int) method and specify your shopId. Make sure that you import the SwopStoreSDK module in each place.

```swift
import SwopStoreSDK

...
SwopStoreSDK.shared.initSDK(863)
```



where 863 is shopId.


To collect parameters for an order, use the builder pattern for the order object

```swift
SwopStoreSDK.shared.getCurrentOrder().
                setCustomerFirstName("name").
                 setCustomerLastName("lastname")...
```


Possible parameters for the Order object:
Gender {
    male,
    female
}
 
 customerFirstName: String
 customerLastName: String
 customerEmail: String
 customerPhone: String
 customerGender: Gender
 orderId: String
 orderValue: String
 orderCurrency: Currency
 usedPromoCode: String
 usedCategory : String



It is possible to add a few Order objects, to choose it and insert it into BannerView.
 
After that add a WKWebView to the autolayout markup and specify BannerView as the class for the current View (SwopStoreSDK module), or create it programmatically as usual.
 
Create a Banner object, and pass bannerId and Order to it.

```swift
let banner = Banner(bannerId, order)
```

Also, we have a method for generating a Banner object for the current Order in SwopStoreSDK.getBannerWithCurrentOrder(bannerId).
 
Call the showBanner(banner) method on the BannerView on ready.

```swift

@IBOutlet bannerView : BannerView
 
bannerView.showBanner(banner)
```


The showBanner() method has an optional parameter scale : Double - to zoom in or zoom out the banner (default 1.0).
 
To reset the current Order call the SwopStoreSDK.shared.resetCurrentOrder() method.


The complete code looks like this:

```swift
@IBOutlet bannerView : BannerView
       
        SwopStoreSDK.shared.initSdk(863)
 
        SwopStoreSDK.shared.resetCurrentOrder()
 
        SwopStoreSDK.shared.getCurrentOrder().customerFirstName = "FirstName"
        SwopStoreSDK.shared.getCurrentOrder().setCustomerLastName("LastName")
                                      .setCustomerGender(Order.Gender.male)
      
        let banner = SwopStoreSDK.shared.getBannerWithCurrentOrder(2804)
        bannerView.showBanner(banner, 1.0)
```


where 863 is the ShopId and 2804 is the BannerId.

## License

SwopStoreSDK is available under the MIT license. See the LICENSE file for more info.
