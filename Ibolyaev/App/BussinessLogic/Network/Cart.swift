import Alamofire

class Cart: AbstractRequestFactory {
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

extension Cart: CartRequestFactory {
    
    struct AddToCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.approveReview
        let id: Int
        let quantity: Int
        var parameters: Parameters? {
            return ["id_product": id,
                    "quantity": quantity]
        }
    }
    
    struct DeleteFromCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.approveReview
        let id: Int
        var parameters: Parameters? {
            return ["id_product": id]
        }
    }
    
    func add(product: Product, quantity: Int, completionHandler: @escaping (DataResponse<CartAddResult>) -> Void) {
        let request = AddToCart(baseUrl: configuration.baseUrl, id: product.id, quantity: quantity)
        self.request(reques: request, completionHandler: completionHandler)
    }
    
    func remove(product: Product, completionHandler: @escaping (DataResponse<CartDeleteResult>) -> Void) {
        let request = DeleteFromCart(baseUrl: configuration.baseUrl, id: product.id)
        self.request(reques: request, completionHandler: completionHandler)
    }
    
}
