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

    func testGetProductListOnSuccess() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductList(page: 1, pageSize: 1, onSuccess: { product in
            expectation.fulfill()
        }, onFailure: { _ in
            assertionFailure("Should not arrive at this stage")
        })
    }
    
    func testGetProductListOnFailure() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductList(page: 1, pageSize: 1, onSuccess: { _ in
            assertionFailure("Should not arrive at this stage")
        }, onFailure: { error in
            expectation.fulfill()
        })
    }
    
    func testGetProductDataOnSuccess() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductData(id: 1, onSuccess: { product in
            expectation.fulfill()
        }, onFailure: { _ in
            assertionFailure("Should not arrive at this stage")
        })
    }
    
    func testGetProductDataOnFailure() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductData(id: 1, onSuccess: { product in
            assertionFailure("Should not arrive at this stage")
        }, onFailure: { error in
            expectation.fulfill()
        })
    }
}
