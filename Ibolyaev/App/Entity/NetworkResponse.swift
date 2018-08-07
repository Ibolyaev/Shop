import Foundation
// Содержатся различные структуры для работы с сетью, отвечающие за сериализацию ответов от сервера

struct UserDataUpdateResult: Codable {
    let result: Int
}

struct LoginResult: Codable {
    let result: Int
    let user: User
}

struct SignUpResult: Codable {
    let result: Int
    let userMessage: String
}

struct LogoutResult: Codable {
    let result: Int
}

struct ReviewRemoveResult: Codable {
    let result: Int
}

struct ReviewApproveResult: Codable {
    let result: Int
}

struct ReviewAddResult: Codable {
    let result: Int
    let userMessage: String
}

struct CartAddResult: Codable {
    let result: Int
}

struct CartDeleteResult: Codable {
    let result: Int
}

struct CartGetResult: Codable {
    let contents: [CartItem]
    let amount: Int
    let countGoods: Int
}

struct ProductListResult: Codable {
    let pageNumber: Int
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products = "products"
    }
}

struct ProductResponse: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
