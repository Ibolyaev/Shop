import Foundation

// Хранит информацию о пользователе
// requiredFields - список обязательных полей для регистрации

struct User: Codable {
    
    private static var requiredFields = ["name", "email", "gender", "password", "creditCard"]
    
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
    
    func filledCorrectly() -> Bool {        
        let mirror = Mirror(reflecting: self)
        // Не придумал, как обойтись без начального положения переменной, при вызове reduce
        let result = true
        // Преобразовываем "зеркало" элемента к типу (String, String), где в роли ключа - имя переменной структуры User, значение - соответсвующие значение структуры User
        return mirror.children
            .flatMap { (item) -> (key: String, value: String)? in
                guard let key = item.label, let value = item.value as? String else {
                    return nil
                }
                return (key, value)
            }
            // Отбираем только обязательные поля
            .filter {
                User.requiredFields.index(of: $0.key) != nil
            }
            // Преобразовываем массив в булево, проверяя заполненность нужных реквизитов, если хотя бы один не заполнен, возвращаем ложь
            .reduce(result) { (result, item) -> Bool in
                if !result {
                    return false
                } else {
                    return !item.value.isEmpty
                }
        }
    }
    
}
