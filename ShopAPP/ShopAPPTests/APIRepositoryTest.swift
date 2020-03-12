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

    func testGetProductList() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductList(page: 1, pageSize: 1, onSuccess: { product in
            expectation.fulfill()
        }, onFailure: { error in })
        
        XCTAssertEqual(mockedDataSource.called, true)
    }

}
fileprivate class MockedAPIDataSource : APIDataSource{
    var called = false
    
    func getProductList(page: Int, pageSize: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->() ) {
        self.called = true
    }
}
