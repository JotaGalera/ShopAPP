import XCTest
@testable import ShopAPP

class APIRepositoryTest: XCTestCase {

    var sut : APIRepository?
    
    override func setUp() {
        super.setUp()
        sut = APIRepositoryImplementation()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGetProductList() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        let productListEmpty = ProductList(arrayProducts: [ProductDomain(name: "", brand: "", price: 0, currency: "", image: "")])
        let mockedAPIDataSource = MockedAPIDataSource()
        
        sut?.getProductList(completion: { product in
            expectation.fulfill()
            XCTAssertEqual(product, productListEmpty)
            XCTAssertEqual(mockedAPIDataSource.called, true)
        })
    }

}
class MockedAPIDataSource : APIDataSource{
    var called = false
    
    func getProductList( completion: @escaping (Data)->() ){
        self.called = true
    }
}
