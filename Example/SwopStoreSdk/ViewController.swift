//
//  ViewController.swift
//

import UIKit
import SwopStoreSdk
import Pods_SwopStoreSdk_Example

class ViewController: UIViewController {

    @IBOutlet weak var bannerView: BannerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //FIrst init sdk with shopId
        SwopStoreSDK.shared.initSDK(shopId: 863)
        //add parametres for order
        SwopStoreSDK.shared.getCurrentOrder().customerFirstName = "FirstName"
        //add more parametres for order if needed
        SwopStoreSDK.shared.getCurrentOrder().setCustomerLastName("LastName")
            .setCustomerGender(Order.Gender.male).setOrderCurrency(Currency.USD)


       
        let banner = SwopStoreSDK.shared.getBannerWithCurrentOrder(bannerId: 2804)
        bannerView.showBanner(banner: banner, scale: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

