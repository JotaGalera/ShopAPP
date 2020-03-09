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
        
        sut?.getProductList(completion: { product in
            expectation.fulfill()
        })
        
        XCTAssertEqual(mockedDataSource.called, true)
    }

}
fileprivate class MockedAPIDataSource : APIDataSource{
    var called = false
    
    func getProductList( completion: @escaping (Data)->() ){
        self.called = true
    }
}
