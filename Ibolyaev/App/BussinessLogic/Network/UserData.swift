import Alamofire

//Используется для получения запросов обновления данных пользователя

class UserData: BasicFactory {
}

extension UserData: UserDataRequestFactory {
    
    struct UserDataUpdate: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.changeUserData
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
    
    func update(user: User, completionHandler: @escaping (DataResponse<UserDataUpdateResult>) -> Void) {
        let requestModel = UserDataUpdate(baseUrl: configuration.baseUrl, user: user)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }    
    
}
