import XCTest
@testable import ShopAPP

class ProductListTest: XCTestCase {
    var sut : ProductList?
    
    override func setUp() {
        super.setUp()
        let arrayEmpty : [Product] = []
        sut = ProductList(arrayProducts: arrayEmpty)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAddProductsToList(){
        let mockProduct = Product(name: "shirts", brand: "Tommy Hilfiger", price: 80, currency: "€", image: "https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg")
        
        sut?.addProductsToList(product: mockProduct)
        
        XCTAssertEqual(sut?.getProductToList(index: 0), mockProduct)
    }
    
    func testCount(){
        let mockProduct = Product(name: "shirts", brand: "Tommy Hilfiger", price: 80, currency: "€", image: "https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg")
        
        sut?.addProductsToList(product: mockProduct)
        
        XCTAssertEqual(sut?.count(), 1)
    }
    
    func testSetSizeTotalPage (){
        let mockSizeTotalPage = 1
        
        sut?.setSizeTotalPage(mockSizeTotalPage)
        
        XCTAssertEqual(sut?.getSizeTotalPage(), mockSizeTotalPage)
    }
}

/*

 class ProductList{
     private var arrayProducts: [ProductDomain] = []
     private var sizeTotalPage: Int?
    
     init (arrayProducts: [ProductDomain]) {
         self.arrayProducts = arrayProducts
     }
     
     func setSizeTotalPage(_ sizeTotalPage: Int){
         self.setSizeTotalPage(sizeTotalPage)
     }
     
     func addProductsToList( product: ProductDomain ){
         arrayProducts.append(product)
     }
     
     func getProductToList(index: Int) -> ProductDomain{
         return arrayProducts[index]
     }
     
     func count() -> Int {
         return arrayProducts.count
     }
 }
 */
