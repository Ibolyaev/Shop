import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.ephemeral
        let manager = SessionManager(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
    
    func makeUserDataRequestFatory() -> UserDataRequestFactory {
        let errorParser = makeErrorParser()
        return UserData(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
    
    func makeProductsRequestFactory() -> ProductsRequestFactory {
        let errorParser = makeErrorParser()
        return Products(errorParser: errorParser,
                        sessionManager: commonSessionManager,
                        queue: sessionQueue
        )
    }
    
    func makeReviewRequestFactory() -> ReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser,
                      sessionManager: commonSessionManager,
                      queue: sessionQueue
        )
    }
    
    func makeCartRequestFactory() -> CartRequestFactory {
        let errorParser = makeErrorParser()
        return Cart(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
}
