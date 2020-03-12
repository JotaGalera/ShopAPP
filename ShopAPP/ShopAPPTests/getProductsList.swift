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
        
        sut?.execute(page: 1, pageSize: 1, onSuccess: { product in
            expectation.fulfill()
        }, onFailure: { error in })
        XCTAssertEqual(self.mockedAPIRepository.called, true)
    }
}

fileprivate class MockedAPIRepository : APIRepository{
    var called = false
    
    func getProductList(page:Int, pageSize:Int, onSuccess: @escaping (ProductList) -> (), onFailure: @escaping (String)->() ) {
        self.called = true
    }
    
    func getProductDetail(id: Int, onSuccess: @escaping (Product) -> (), onFailure: @escaping (String)->()) {
        return
    }
}
