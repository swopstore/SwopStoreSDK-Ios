//
//  Order.swift
//  sdk
//

import Foundation

public class Order {
    
    
    public  enum Gender : String {
       case male = "male"
       case female = "female"
        var description : String {
            get {
                return self.rawValue
            }
        }
    }
    
    public  var customerFirstName: String? = nil
    public  var customerLastName: String? = nil
    public   var customerEmail: String? = nil
    public   var customerPhone: String? = nil
    public   var customerGender: Gender? = nil
    public   var orderId: String? = nil
    public   var orderValue: String? = nil
    public   var orderCurrency: Currency? = nil
    public   var usedPromoCode: String? = nil
    public  var usedCategory : String? = nil

    public   func setCustomerFirstName(_ customerFirstName: String?) -> Order {
          self.customerFirstName = customerFirstName
          return self
      }

    public   func setCustomerLastName(_ customerLastName: String?) -> Order {
        self.customerLastName = customerLastName
          return self
      }

    public  func setCustomerEmail(_ customerEmail: String?) -> Order {
        self.customerEmail = customerEmail
          return self
      }

    public   func setCustomerPhone(_ customerPhone: String?) -> Order {
        self.customerPhone = customerPhone
          return self
      }

    public   func setCustomerGender(_ customerGender: Gender) -> Order {
        self.customerGender = customerGender
          return self
      }


    public   func setOrderId(_ orderId: String?)-> Order {
        self.orderId = orderId
          return self
      }

    public func setOrderValue(_ orderValue: String?)-> Order {
        self.orderValue = orderValue
          return self
      }

    public   func setOrderCurrency(_ orderCurrency: Currency?)-> Order {
        self.orderCurrency = orderCurrency
          return self
      }

    public func setUsedPromoCode(_ usedPromoCode: String?)-> Order {
        self.usedPromoCode = usedPromoCode
          return self
      }

    public  func setUsedCategory(_ usedCategory: String?)-> Order {
          self.usedCategory = usedCategory
          return self
      }

}
