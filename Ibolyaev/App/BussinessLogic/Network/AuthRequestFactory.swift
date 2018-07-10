import Alamofire

protocol AuthRequestFactory {
 
    func login(
        userName: String,
        password: String,
        completionHandler: @escaping (DataResponse<LoginResult>) -> Void)
    
    func signUp(user: User, completionHandler: @escaping (DataResponse<SignUpResult>) -> Void)
    
    func logout(user: User, completionHandler: @escaping (DataResponse<LogoutResult>) -> Void)

}
