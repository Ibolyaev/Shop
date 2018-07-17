import Alamofire
import OHHTTPStubs
@testable import Ibolyaev

class RequestFactoryMock {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParserStub()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.ephemeral
        OHHTTPStubs.isEnabled(for: configuration)
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
        return Products(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
    
    func makeReviewRequestFactory() -> ReviewRequestFactory {
        let errorParser = makeErrorParser()
        /* Не мойму почему ошибка происходит
         Error:
         Cannot convert return expression of type 'Review' to return type 'ReviewRequestFactory'*/
        return Review(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
    
}
