import XCTest
@testable import ShopAPP


class GetProductDetailTest: XCTestCase {
    var sut : GetProductDetailUseCase?
        
    override func setUp() {
        super.setUp()
        sut = GetProductDetailUseCaseImplementation()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
