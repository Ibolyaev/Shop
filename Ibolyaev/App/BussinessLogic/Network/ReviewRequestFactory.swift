import Alamofire

protocol ReviewRequestFactory {
    
    func add(user: User,
             reviewText: String,
             completionHandler: @escaping (DataResponse<ReviewAddResult>
        ) -> Void
    )
    func approve(id: Int, completionHandler: @escaping (DataResponse<ReviewApproveResult>) -> Void)
    func remove(id: Int, completionHandler: @escaping (DataResponse<ReviewRemoveResult>) -> Void)
}
