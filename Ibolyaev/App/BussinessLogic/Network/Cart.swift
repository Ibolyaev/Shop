import Alamofire

// Используется для получения запросов по работе с корзиной

class Cart: BasicFactory {
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
