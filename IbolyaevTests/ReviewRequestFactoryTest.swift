import XCTest
import OHHTTPStubs
@testable import Ibolyaev

class ReviewRequestFactoryTest: XCTestCase {
    
    var factory: ReviewRequestFactory!
    let testUser = User(id: 1, login: "Test",
                        name: "Test",
                        lastname: "Test",
                        email: nil,
                        gender: nil,
                        creditCard: nil,
                        bio: nil,
                        password: nil
    )
    
    override func setUp() {
        super.setUp()
        let factoryMock = RequestFactoryMock()
        factory = factoryMock.makeReviewRequestFactory()
    }
    
    override func tearDown() {
        factory = nil
        super.tearDown()
    }
    
    func testAddReview() {
        let exp = expectation(description: "")
        var result: ReviewAddResult?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.addReview)
        factory.add(user: testUser, reviewText: "Test") { response in
            exp.fulfill()
            result = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(result)
    }
    
    func testApproveReview() {
        let exp = expectation(description: "")
        var result: ReviewApproveResult?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.approveReview)
        factory.approve(id: 1) { response in
            exp.fulfill()
            result = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(result)
    }
    
    func testRemoveReview() {
        let exp = expectation(description: "")
        var result: ReviewRemoveResult?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.removeReview)
        factory.remove(id: 1) { response in
            exp.fulfill()
            result = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(result)
    }
    
}
