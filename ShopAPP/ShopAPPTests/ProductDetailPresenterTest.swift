import XCTest
@testable import ShopAPP

class ProductDetailPresenterTest: XCTestCase {
    var sut: ProductDetailPresenter?
    fileprivate let mockedGetProductDetailUseCase = MockGetProductDetail()
    
    override func setUp() {
        super.setUp()
        sut = ProductDetailPresenterImplementation(getProductDetailUseCase: mockedGetProductDetailUseCase)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGetProductDetail() {
        sut?.getProductDetail()
        
        XCTAssertEqual(mockedGetProductDetailUseCase.called, true)
        
    }
}
fileprivate class MockGetProductDetail: GetProductDetailUseCase{
    var called = false
    
    func execute(id: Int, onSuccess: @escaping (Product) -> (), onFailure: @escaping (String) -> ()) {
        self.called = true
    }
}
