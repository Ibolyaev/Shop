import Foundation

// struct User - Store information about logged in user or user data for future registration
struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
    var email: String?
    var gender: String?
    var creditCard: String?
    var bio: String?
    var password: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
        case email = "email"
        case gender = "gender"
        case creditCard = "credit_card"
        case bio = "bio"
        case password = "password"
    }
}
