import XCTest
@testable import ShopAPP

class GetProductDetailTest: XCTestCase {
    var sut : GetProductDetailUseCase?
    fileprivate var mockedAPIRepository = MockedAPIRepository()
        
    override func setUp() {
        super.setUp()
        sut = GetProductDetailUseCaseImplementation(repository: mockedAPIRepository)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testExecute() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.execute(id: 1, completion: {_ in
            expectation.fulfill()
        })
        XCTAssertEqual(self.mockedAPIRepository.called, true)
    }
}

fileprivate class MockedAPIRepository : APIRepository{
    var called = false
    
    func getProductList(page:Int, pageSize:Int, completion: @escaping (ProductList) -> ()) {
        self.called = true
    }
}
