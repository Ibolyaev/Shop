import Alamofire

protocol UserDataRequestFactory {
    
    func update(
        user: User,
        completionHandler: @escaping (DataResponse<UserDataUpdateResult>) -> Void)
}
