import Alamofire

class Auth: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let configuration: Configuration
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: SessionManager,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.configuration = Configuration()
    }
}
extension Auth: AuthRequestFactory {
    
    func login(
        userName: String,
        password: String,
        completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
        
        let requestModel = Login(baseUrl: configuration.baseUrl, login: userName, password: password)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func signUp(user: User,
                completionHandler: @escaping (DataResponse<SignUpResult>) -> Void) {        
        let requestModel = SignUp(baseUrl: configuration.baseUrl, user: user)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func logout(user: User, completionHandler: @escaping (DataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: configuration.baseUrl, user: user)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}

// Login
extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.login
        
        let login: String
        let password: String
        
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
}

//Logout
extension Auth {
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.logout
        
        let user: User
        
        var parameters: Parameters? {
            return [
                "id_user": user.id
            ]
        }
    }
}

// SignUp
extension Auth {
    struct SignUp: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.registerUser
        
        let user: User
        
        var parameters: Parameters? {
            return [
                "id_user": user.id,
                "username": user.name,
                "password": user.password ?? "",
                "email": user.email ?? "",
                "gender": user.gender ?? "",
                "credit_card": user.creditCard ?? "",
                "bio": user.bio ?? ""
            ]
        }
    }
}

