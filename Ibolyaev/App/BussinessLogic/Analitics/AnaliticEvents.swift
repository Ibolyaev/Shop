import Foundation

enum AnaliticEvents {
    enum LoginMethods: String {
        case email
    }
    enum Contents: String {
        case productList
        case product
    }    
    case login(method: LoginMethods, success: Bool)
    case signUp(method: LoginMethods, success: Bool)
    case addToCart(product: Product)
    case removeFromCart(product: Product)
    case contentView(content: Contents, id: String?)
    case startCheckout(sum: Int, items: Int)
}

enum CartMethods: String {
    case removeFromCart
}
