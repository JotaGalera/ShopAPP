import XCTest
@testable import ShopAPP

class GetProductsListTest: XCTestCase {
    var sut : GetProductListUseCase?
    fileprivate var mockedAPIRepository = MockedAPIRepository()
    
    override func setUp() {
        super.setUp()
        sut = GetProductListUseCaseImplementation(repository: mockedAPIRepository)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testExecute() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.execute(completion: { product in
            expectation.fulfill()
        })
        XCTAssertEqual(self.mockedAPIRepository.called, true)
    }
}

fileprivate class MockedAPIRepository : APIRepository{
    var called = false
    
    func getProductList(completion: @escaping (ProductList) -> ()) {
        self.called = true
    }
}
