import Foundation

class ProductList{
    private var arrayProducts: [Product] = []
    private var sizeTotalPage: Int = 0
   
    init (arrayProducts: [Product]) {
        self.arrayProducts = arrayProducts
    }
    
    func addProductsToList( product: Product ){
        arrayProducts.append(product)
    }
    
    func addProductListToList (productList : ProductList){
        self.arrayProducts += productList.arrayProducts
    }
    
    func getProductToList(index: Int) -> Product{
        return arrayProducts[index]
    }
    
    func count() -> Int {
        return arrayProducts.count
    }
    
    func setSizeTotalPage(_ sizeTotalPage: Int){
        self.sizeTotalPage = sizeTotalPage
    }
    
    func getSizeTotalPage() -> Int{
        return sizeTotalPage
    }
    
}
extension ProductList : Equatable {
    static func == (lhs: ProductList, rhs: ProductList) -> Bool {
        return lhs.arrayProducts == rhs.arrayProducts
    }
}
