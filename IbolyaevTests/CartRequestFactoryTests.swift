@testable import Ibolyaev
import OHHTTPStubs
import XCTest

class CartRequestFactoryTests: XCTestCase {
    let testProduct = Product(id: 1, name: "Milk", price: 1)
    var factory: CartRequestFactory!
    override func setUp() {
        super.setUp()
        let factoryMock = RequestFactoryMock()
        factory = factoryMock.makeCartRequestFactory()
    }
    
    override func tearDown() {
        factory = nil
        super.tearDown()
    }
    
    func testAddtoCart() {
        let exp = expectation(description: "")
        var result: CartAddResult?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.addToBasket)
        factory.add(product: testProduct, quantity: 1) { response in
            exp.fulfill()
            result = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(result)
    }
    func testDeleteFromCart() {
        let exp = expectation(description: "")
        var result: CartDeleteResult?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.deleteFromBasket)
        factory.remove(product: testProduct) { response in
            exp.fulfill()
            result = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(result)
    }
}
