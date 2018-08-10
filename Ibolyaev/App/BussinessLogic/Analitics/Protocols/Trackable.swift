import Crashlytics
import Foundation

protocol Trackable: class {
    func track(_ event: AnaliticEvents)
}

extension Trackable {
    func track(_ event: AnaliticEvents) {        
        switch event {
        case let .login(method, success):
            Answers.logLogin(withMethod: method.rawValue,
             success: NSNumber(value: success),
             customAttributes: nil)
        case let .addToCart(product):
            Answers.logAddToCart(withPrice: NSDecimalNumber(value: product.price),
                                 currency: "USD",
                                 itemName: product.name,
                                 itemType: nil,
                                 itemId: product.id.description,
                                 customAttributes: nil)
        case let .signUp(method, success):
            Answers.logSignUp(withMethod: method.rawValue,
                              success: NSNumber(value: success),
                              customAttributes: nil)
        case let .contentView(content, contentId):
            Answers.logContentView(withName: content.rawValue,
                                           contentType: nil,
                                           contentId: contentId ?? "",
                                           customAttributes: nil)
            
        case let .removeFromCart(product):
            let customAttributes = ["itemName": product.name,
                                    "itedId": product.id.description]
            Answers.logCustomEvent(withName: CartMethods.removeFromCart.rawValue, customAttributes: customAttributes)
        case let .startCheckout(sum, items):
            Answers.logStartCheckout(withPrice: NSDecimalNumber(value: sum),
             currency: "USD",
             itemCount: NSNumber(value: items),
             customAttributes: [:])
 
        }
    }
}
