import XCTest
@testable import ShopAPP

class ProductListPresenterTest: XCTestCase {
    var sut : ProductListPresenter?
    fileprivate let mockedGetProductListUseCaseImplementation = MockedGetProductListUseCaseImplementation()
    
    override func setUp() {
        super.setUp()
        sut = ProductListPresenterImplementation(getProductListUseCase: mockedGetProductListUseCaseImplementation)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGetData() {
        sut?.getProductList()
        
        XCTAssertEqual(mockedGetProductListUseCaseImplementation.called, true)
    }
}
fileprivate class MockedGetProductListUseCaseImplementation : GetProductListUseCaseImplementation {
    var called = false
    
    override func execute(completion: @escaping (ProductList) -> ()) {
        self.called = true
    }
}
