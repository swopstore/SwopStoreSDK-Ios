//
//  SwopStoreSDK.swift
//  sdk
//

import Foundation

public class SwopStoreSDK {

    enum SDKError: Error {
        case NotInitError
    }
    
    public static let shared = SwopStoreSDK()
    
    private init() {}
    
    var shopId : Int = 0
    var orderMap = [String: Order]()
   

    private  func intSDKErrors() throws {
        try shopIdError()
    }
    private func shopIdError() throws {
        if (shopId == 0) {
            throw SDKError.NotInitError
        }
    }


    /**
            bannerId - BannerId in SwopStore system
            return Banner object with cuurent order
     */
    public  func getBannerWithCurrentOrder(bannerId : Int) -> Banner{
        do {
            try intSDKErrors()
        } catch  {
            print("You have to set shopId first in initSDK() method")
        }
        return Banner(bannerId: bannerId, order: getCurrentOrder())
    }

    /**
          
            return current order
     */
    
    public func getCurrentOrder()->Order {
        return orderMap["current"]!
    }

    /**
                name - name of order to search for
                order - Order with name name
            add order with name and order
     */
    
    public  func addOrder(name: String, order: Order) {
        orderMap[name] = order
    }

    public func resetCurrentOrder() {
        orderMap["current"] =  Order()
    }

     public  func removeOrder(name: String) {
        orderMap.removeValue(forKey: name)
    }

    public  func getOrderBy(name: String)-> Order? {
        return orderMap[name]
    }

    public   func clearOrders() {
        orderMap.removeAll()
    }


    public  func initSDK(shopId : Int){
        self.shopId = shopId
        orderMap["current"] =  Order()
    }
    

}
