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
