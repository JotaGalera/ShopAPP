import XCTest
@testable import ShopAPP

class ProductDataListMapperTest: XCTestCase {
    var sut : ProductListDataMapper?
    
    override func setUp() {
        super.setUp()
        sut = ProductListDataMapper()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testConvertToDTO() {
        let mockDataAsDictionary : [String:Any] = ["id": 1, "name": "shirts", "brand": "Tommy Hilfiger", "price": 80, "currency": "€", "image": "https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg", "_link": "http://bestsecret-recruitment-api.herokuapp.com/products/1", "_type": "product"]
        let mockProductData : ProductData = ProductData(dict: mockDataAsDictionary)
        let mockProductDataList : ProductListData = ProductListData(arrayProductData: [mockProductData])
        var mockJsonData : Data
        
        do {
            mockJsonData = try JSONSerialization.data(withJSONObject: mockDataAsDictionary, options: .prettyPrinted)
            guard let productDataConverted = sut?.convertToDTO(data: mockJsonData) else { return }
            
            XCTAssertEqual(productDataConverted, mockProductDataList)
        } catch {
            XCTAssert(false)
        }
    }
    
    func testConvert() {
        let mockProductData = ProductData(dict: ["id": 1, "name": "shirts", "brand": "Tommy Hilfiger", "price": 80, "currency": "€", "image": "https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg", "_link": "http://bestsecret-recruitment-api.herokuapp.com/products/1", "_type": "product"])
        let mockProductListData = ProductListData(arrayProductData: [mockProductData])
        let mockProductList = ProductList(arrayProducts: [Product(name: "shirts", brand: "Tommy Hilfiger", price: 80, currency: "€", image: "https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg")])
        
        let productList = sut?.convert(dto: mockProductListData)
        
        XCTAssertEqual(productList, mockProductList)
    }
}
