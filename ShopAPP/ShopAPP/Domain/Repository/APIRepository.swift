import Foundation

protocol APIRepository{
    func getProductList(completion: @escaping (ProductList) -> ())
}
