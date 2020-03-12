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

    func testGetProductList() {
        sut?.getProductList()
        
        XCTAssertEqual(mockedGetProductListUseCaseImplementation.called, true)
    }
    
    func testGetNextProductList() {
        sut?.getNextProductList()
        
        XCTAssertEqual(mockedGetProductListUseCaseImplementation.called, true)
    }
    
    func testCanGoNextPage() {
        XCTAssertEqual(sut?.canGoNextPage(), false)
    }
    
    func testGoNextPageThenUpdateIndex() {
        sut?.goNextPageThenUpdateIndex() 
    
        XCTAssertEqual(sut?.canGoNextPage(), false)
    }
}
fileprivate class MockedGetProductListUseCaseImplementation : GetProductListUseCaseImplementation {
    var called = false
    
    override func execute(page: Int, pageSize: Int, completion: @escaping (ProductList) -> ()) {
        self.called = true
    }
}
