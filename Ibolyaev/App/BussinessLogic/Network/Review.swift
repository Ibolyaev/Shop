import Alamofire

//Используется для получения запросов работы с отзывами

class Review: BasicFactory {   
}

extension Review: ReviewRequestFactory {
    
    struct ApproveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.approveReview
        let id: Int
        var parameters: Parameters? {
            return ["id_comment": id]
        }
    }
    
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.removeReview
        let id: Int
        var parameters: Parameters? {
            return ["id_comment": id]
        }
    }
    
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.addReview
        let user: User
        let reviewText: String
        var parameters: Parameters? {
            return [
                "id_user": user.id,
                "text": reviewText
            ]
        }
    }
    
    func approve(id: Int, completionHandler: @escaping (DataResponse<ReviewApproveResult>) -> Void) {
        let request = ApproveReview(baseUrl: configuration.baseUrl, id: id)
        self.request(reques: request, completionHandler: completionHandler)
    }
    
    func remove(id: Int, completionHandler: @escaping (DataResponse<ReviewRemoveResult>) -> Void) {
        let request = RemoveReview(baseUrl: configuration.baseUrl, id: id)
        self.request(reques: request, completionHandler: completionHandler)
    }
    
    func add(user: User, reviewText: String, completionHandler: @escaping (DataResponse<ReviewAddResult>) -> Void) {
        let request = AddReview(baseUrl: configuration.baseUrl, user: user, reviewText: reviewText)
        self.request(reques: request, completionHandler: completionHandler)
    }
    
    
}
