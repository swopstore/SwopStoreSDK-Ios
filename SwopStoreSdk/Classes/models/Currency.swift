//
//  Currency.swift
//  sdk
//

import Foundation

public class Currency {
    
    let currencyCode : String
    let displayName : String?
    let numericCode : Int?
    let symbol  : String?

    public  init(_ currencyCode : String, _ displayName :String? = nil,
         _ numericCode : Int? = 0,_ symbol : String? = nil){
        self.currencyCode = currencyCode
        self.displayName = displayName
        self.numericCode = numericCode
        self.symbol = symbol
        
    }


    public static let RUB  =  Currency("RUB","Russian Ruble",643,"₽")
    public static let USD  =  Currency("USD","U.S. dollar",840,"$")
    public static let SGD  =  Currency("SGD","Singapore dollar",702,"SGD")
    public static let ZAR  =  Currency("ZAR","South African rand",710,"ZAR")
    public static let UYW  =  Currency("UYW","",927,"UYW")
    public static let CRC  =  Currency("CRC","Costa Rican colon",188,"CRC")
    public static let XAU  =  Currency("XAU","GOLD",959,"XAU")
    public static let XXX  =  Currency("XXX","unknown currency",999,"XXX")
   
    public static let BYN  =  Currency("BYN","Belarusian ruble",933,"BYN")
    public static let GBP  =  Currency("BYR","British pound sterling",826,"£")
    public static let EUR  =  Currency("EUR","Euro",978,"€")
    public static let INR  =  Currency("INR","Indian rupee",356,"₹")
    public static let LKR  =  Currency("LKR","Sri Lankan rupee",144,"LKR")

   

}
