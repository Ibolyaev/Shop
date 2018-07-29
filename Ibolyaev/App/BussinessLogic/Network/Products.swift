import Alamofire

//class Products - can be used to get product list, or get product by its id
class Products: BasicFactory {
}

extension Products: ProductsRequestFactory {
    
    
    struct ProductById: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.getGoodById
        
        var parameters: Parameters? {
            return [:]
        }
    }
    
    struct ProductsGetList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.catalogData
        let pageNumber: Int
        let category: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": category
            ]
        }
    }
    
    func getList(category: Int, page pageNumber: Int, completionHandler: @escaping (DataResponse<[Product]>) -> Void) {
        let request = ProductsGetList(baseUrl: configuration.baseUrl, pageNumber: pageNumber, category: category)
        self.request(reques: request, completionHandler: completionHandler)
    }
    
    func getWith(id: Int, completionHandler: @escaping (DataResponse<ProductResponse>) -> Void) {
        let request = ProductById(baseUrl: configuration.baseUrl)
        self.request(reques: request, completionHandler: completionHandler)
    }
    
}
