import XCTest
import OHHTTPStubs
@testable import Ibolyaev

class ProductsRequestFactoryTest: XCTestCase {
    
    var factory: ProductsRequestFactory!
    override func setUp() {
        super.setUp()
        let factoryMock = RequestFactoryMock()
        factory = factoryMock.makeProductsRequestFactory()    }
    
    override func tearDown() {
        factory = nil
        super.tearDown()
    }
    
    func testGetList() {
        let exp = expectation(description: "")
        var result: [Product]?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.catalogData)
        factory.getList(category: 1, page: 1) { response in
            exp.fulfill()
            result = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(result)
    }
    func testGetWithId() {
        let exp = expectation(description: "")
        var result: ProductResponse?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.getGoodById)
        factory.getWith(id: 1) { response in
            exp.fulfill()
            result = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(result)
    }
    
}
