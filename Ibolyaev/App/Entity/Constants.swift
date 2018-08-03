import Foundation

enum Api {
    static let login = "login.json"
    static let changeUserData = "changeUserData.json"
    static let getGoodById = "getGoodById.json"
    static let logout = "logout.json"
    static let registerUser = "registerUser.json"
    static let catalogData = "catalogData.json"
    static let addReview = "addReview.json"
    static let approveReview = "approveReview.json"
    static let removeReview = "removeReview.json"
    static let addToBasket = "addToBasket.json"
    static let deleteFromBasket = "deleteFromBasket.json"
    static let getBasket = "getBasket.json"
    static let url = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"
}

enum SegueIdentifiers {
    static let userInformation = "showUserInformation"
    static let showProducts = "showProducts"
    static let showProduct = "showProduct"
    static let checkOut = "checkOut"
}

enum TableViewCellIdentifiers {
    static let productCell = "productCell"
    static let reviewCell = "ReviewCell"
    static let cartCell = "CartCell"
}

enum Nibs {
    static let productCell = "ProductCell"
    static let reviewCell = "ReviewCell"
    static let cartCell = "CartCell"
}
