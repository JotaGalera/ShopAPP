import XCTest
@testable import ShopAPP

class APIDataSourceTest: XCTestCase {
    
    var sut : APIDataSource?
    
    override func setUp() {
        super.setUp()
        sut = APIDataSourceImplementation()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGetProductList() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductList(completion: { string in
            expectation.fulfill()
        })
    }
}
