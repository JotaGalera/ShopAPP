import Foundation

protocol APIRepository{
    func getProductList(page:Int, pageSize: Int, completion: @escaping (ProductList) -> ())
}
