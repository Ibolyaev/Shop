import Alamofire

class UserData: AbstractRequestFactory {
    
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

extension UserData: UserDataRequestFactory {
    func update(user: User, completionHandler: @escaping (DataResponse<UserDataUpdateResult>) -> Void) {
        let requestModel = UserDataUpdate(baseUrl: configuration.baseUrl, user: user)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    struct UserDataUpdate: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
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
