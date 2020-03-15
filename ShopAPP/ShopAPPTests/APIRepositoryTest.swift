import XCTest
@testable import ShopAPP

class APIRepositoryTest: XCTestCase {
    var sut : APIRepository?
    fileprivate let mockedDataSource = MockedAPIDataSource()
    
    override func setUp() {
        super.setUp()
        sut = APIRepositoryImplementation(dataSource: mockedDataSource)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGetProductListOnSuccess() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductList(page: 1, pageSize: 1, onSuccess: { productList in
            expectation.fulfill()
        }, onFailure: { _ in
            assertionFailure("Should not arrive at this stage")
        })
        
        XCTAssertEqual(mockedDataSource.called, true)
    }
    
    func testGetProductListOnFailure() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductList(page: 1, pageSize: 1, onSuccess: { _ in
            assertionFailure("Should not arrive at this stage")
        }, onFailure: { error in
            expectation.fulfill()
        })
        
        XCTAssertEqual(mockedDataSource.called, true)
    }
    
    func testGetProductDetailOnSuccess(){
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductDetail(id: 1, onSuccess: { product in
            expectation.fulfill()
        }, onFailure: { _ in
            assertionFailure("Should not arrive at this stage")
        })
        XCTAssertEqual(mockedDataSource.called, true)
    }
    
    func testGetProductDetailOnFailure(){
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductDetail(id: 1, onSuccess: { _ in
            assertionFailure("Should not arrive at this stage")
        }, onFailure: { error in
            expectation.fulfill()
        })
        XCTAssertEqual(mockedDataSource.called, true)
    }

}
fileprivate class MockedAPIDataSource : APIDataSource{
    var called = false
    
    func getProductList(page: Int, pageSize: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->() ) {
        self.called = true
    }
    
    func getProductData(id: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->() ){
        self.called = true
    }
}
