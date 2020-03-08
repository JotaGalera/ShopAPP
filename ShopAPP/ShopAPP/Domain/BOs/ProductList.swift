import Foundation

class ProductList : Equatable{
    private var arrayProducts: [ProductDomain] = []
   
    init (arrayProducts: [ProductDomain]) {
        self.arrayProducts = arrayProducts
    }
    
    func addProductsToList( product: ProductDomain ){
        arrayProducts.append(product)
    }
    
    func getProductToList(index: Int) -> ProductDomain{
        return arrayProducts[index]
    }
    
    static func == (lhs: ProductList, rhs: ProductList) -> Bool {
        return lhs.arrayProducts == rhs.arrayProducts
    }
}
