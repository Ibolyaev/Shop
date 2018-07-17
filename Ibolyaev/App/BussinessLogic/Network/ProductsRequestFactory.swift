import Alamofire

protocol ProductsRequestFactory {
    func getList(category: Int,
                 page: Int,
                 completionHandler: @escaping (DataResponse<[Product]>) -> Void
    )
    func getWith(id: Int,
                 completionHandler: @escaping (DataResponse<ProductResponse>) -> Void
    )
}
