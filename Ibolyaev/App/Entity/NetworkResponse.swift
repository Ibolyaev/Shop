import Foundation

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
