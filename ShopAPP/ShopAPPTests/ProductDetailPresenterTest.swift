import XCTest
@testable import ShopAPP

class ProductDetailPresenterTest: XCTestCase {
    var sut: ProductDetailPresenter?
    
    override func setUp() {
        super.setUp()
        sut = ProductDetailPresenterImplementation()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testExample() {
    }

    

}
