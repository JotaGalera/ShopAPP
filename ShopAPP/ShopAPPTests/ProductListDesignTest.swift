import XCTest
@testable import ShopAPP

class ProductDesignTest: XCTestCase {

    var sut : ProductDesign?
    
    func initTest() {
        let smokeProductDomain : ProductDomain = ProductDomain(name: "name", brand: "brand", price: 1, currency: "currency", image: "image")
        
        sut = ProductDesign(product: smokeProductDomain)
        
        XCTAssertEqual(sut?.nameCell, "name")
        XCTAssertEqual(sut?.textPriceLabel, "1 currency")
    }
}
