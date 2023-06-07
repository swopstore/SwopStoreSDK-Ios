//
//  Banner.swift
//  sdk
//

import Foundation

public class Banner {
    
    let bannerId : Int
    var order : Order?
    
 
    
    public  init(bannerId : Int, order : Order?){
        self.bannerId = bannerId
        self.order = order
    }
    
    private func generateParamString(_ paramName: String, _ paramVal: String?)->String?{
        if(paramVal != nil){
            return "'\(paramName)': '\(paramVal!)'"
        }
        return nil
    }
    
    private func generateHTML(scale : Double)->String {
        let string = "<html>" +
        "<HEAD><meta name=\"viewport\" content=\"width=device-width,height=device-height,initial-scale=\(scale), shrink-to-fit=no\"></HEAD>" +
                "<body>" +
                "<div id=\"promocode-element-container\"></div>" +
                "<script type=\"text/javascript\">\n" +
                "var _iPromoBannerObj = function() {\n" +
                "this.htmlElementId = 'promocode-element-container';\n" +
                "this.params = {\n" +
                generateParams() +
                "};\n" +
                "\n" +
                "this.lS=function(s){document.write('<sc'+'ript type=\"text/javascript\" src=\"'+s+'\" async=\"true\"></scr'+'ipt>');},\n" +
                "this.gc=function(){return document.getElementById(this.htmlElementId);};\n" +
                "var r=[];for(e in this.params){if(typeof(e)==='string'){r.push(e+'='+encodeURIComponent(this.params[e]));}}r.push('method=main');r.push('jsc=iPromoCpnObj');this.lS(('https:'==document.location.protocol ? 'https://':'http://')+'swopstore.com/wrapper.php?'+r.join('&'));};\n" +
                "\n" +
                "var iPromoCpnObj = new _iPromoBannerObj();\n" +
                "</script>" +
                "</body>" +
                "</html>"
        return string
    }

    func getScript(scale : Double)->String {
        return generateHTML(scale: scale)
    }

    func getDebugScript(scale : Double)->String {
        return generateStagingHTML(scale: scale)
    }
    
    private func generateStagingHTML(scale : Double)-> String {
        let string = "<html>" +
        "<HEAD><meta name=\"viewport\" content=\" width=device-width,height=device-height,initial-scale=\(scale), shrink-to-fit=no\"></HEAD>" +
                "<body>" +
                "<div id=\"promocode-element-container\"></div>" +
                "<script type=\"text/javascript\">\n" +
                "var _iPromoBannerObj = function() {\n" +
                "this.htmlElementId = 'promocode-element-container';\n" +
                "this.params = {\n" +
                generateParams() +
                "};\n" +
                "\n" +
                "this.lS=function(s){document.write('<sc'+'ript type=\"text/javascript\" src=\"'+s+'\" async=\"true\"></scr'+'ipt>');},\n" +
                "this.gc=function(){return document.getElementById(this.htmlElementId);};\n" +
                "var r=[];for(e in this.params){if(typeof(e)==='string'){r.push(e+'='+encodeURIComponent(this.params[e]));}}r.push('method=main');r.push('jsc=iPromoCpnObj');this.lS(('https:'==document.location.protocol ? 'https://':'http://')+'staging.swopstore.com/wrapper.php?'+r.join('&'));};\n" +
                "\n" +
                "var iPromoCpnObj = new _iPromoBannerObj();\n" +
                "</script>" +
                "</body>" +
                "</html>"
        return string
    }

    private func generateParams()->String {
        let shopIdParams = generateParamString("_shopId", SwopStoreSDK.shared.shopId.description)
        let bannerIdIdParams = generateParamString("_bannerId", bannerId.description)
        let firstNameParams = generateParamString("_customerFirstName", order?.customerFirstName)
        let lastnameIdParams = generateParamString("_customerLastName", order?.customerLastName)
        let emailParams = generateParamString("_customerEmail", order?.customerEmail)
        let phoneParams = generateParamString("_customerPhone", order?.customerPhone)
        let genderParams = generateParamString("_customerGender", order?.customerGender?.description)
        let orderIdParams = generateParamString("_orderId", order?.orderId)
        let orderValueParams = generateParamString("_orderValue", order?.orderValue)
        let currencyParams = generateParamString("_orderCurrency", order?.orderCurrency?.currencyCode)
        let promocodeParams = generateParamString("_usedPromoCode", order?.usedPromoCode)
        let categoryParams = generateParamString("_usedCategory", order?.usedCategory)

        let list = [shopIdParams,bannerIdIdParams,firstNameParams,lastnameIdParams,emailParams,
                    phoneParams,genderParams,orderIdParams,orderValueParams,currencyParams,promocodeParams,
                    categoryParams]
       
        let notNilList = list.filter { string in
            string != nil
        }
        var paramsString : String = ""
        var index = 1
        notNilList.forEach { param in
            if(index == list.count){
                paramsString = ("\(paramsString)  \(param!) \n")
            }else{
                paramsString = ("\(paramsString)  \(param!) ,\n")
            }
            index = index + 1
        }
        return paramsString
    }

    
}
