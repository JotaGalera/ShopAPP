import XCTest
@testable import ShopAPP

class ProductDataMapperTest: XCTestCase {
    var sut : ProductDataMapper?
    
    override func setUp() {
        super.setUp()
        sut = ProductDataMapper()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testConvertDTODictionary(){
        let mockDataAsDictionary : [String:Any] = ["id": 1, "name": "shirts", "brand": "Tommy Hilfiger", "price": 80, "currency": "€", "image": "https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg", "_link": "http://bestsecret-recruitment-api.herokuapp.com/products/1", "_type": "product"]
        let mockProductData : ProductData = ProductData(dict: mockDataAsDictionary)
        
        let productDataConverted = sut?.convertToDTO(dict: mockDataAsDictionary)
        
        XCTAssertEqual(mockProductData, productDataConverted)
    }
    
    func testConvertDTOData() {
        let mockData : [String:Any] = ["list":["id": 1, "name": "shirts", "brand": "Tommy Hilfiger", "price": 80, "currency": "€", "image": "https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg", "_link": "http://bestsecret-recruitment-api.herokuapp.com/products/1", "_type": "product"]]
        let mockProductData : ProductData = ProductData(dict: mockData["list"] as! [String : Any])
        var mockJsonData : Data
        
        
        
        do {
            mockJsonData = try JSONSerialization.data(withJSONObject: mockData, options: .prettyPrinted)
            let productDataConverted = sut?.convertToDTO(data: mockJsonData)
            
            XCTAssertEqual(productDataConverted, mockProductData)
        } catch {
            XCTAssert(false)
        }
    }
    
    func testConvert() {
        let mockProductData = ProductData(dict: ["id": 1, "name": "shirts", "brand": "Tommy Hilfiger", "price": 80, "currency": "€", "image": "https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg", "_link": "http://bestsecret-recruitment-api.herokuapp.com/products/1", "_type": "product"])
        let mockProductDomain = ProductDomain(name: "shirts", brand: "Tommy Hilfiger", price: 80, currency: "€", image: "https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg")
        
        let productDomain = sut?.convert(dto: mockProductData)
        
        XCTAssertEqual(mockProductDomain, productDomain)
    }
}

