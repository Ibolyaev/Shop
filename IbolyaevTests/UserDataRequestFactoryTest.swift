@testable import Ibolyaev
import OHHTTPStubs
import XCTest

class UserDataRequestFactoryTest: XCTestCase {
    let testUser = User(id: 1, login: "Test",
                        name: "Test",
                        lastname: "Test",
                        email: nil,
                        gender: nil,
                        creditCard: nil,
                        bio: nil,
                        password: nil
    )
    var factory: UserDataRequestFactory!
    override func setUp() {
        super.setUp()
        let factoryMock = RequestFactoryMock()
        factory = factoryMock.makeUserDataRequestFatory()
    }
    
    override func tearDown() {
        factory = nil
        super.tearDown()
    }
    
    func testUpdate() {
        let exp = expectation(description: "")
        var result: UserDataUpdateResult?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.changeUserData)
        factory.update(user: testUser) { response in
            exp.fulfill()
            result = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(result)
    }
    
    
}
