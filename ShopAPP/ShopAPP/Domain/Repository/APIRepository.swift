import Foundation

protocol APIRepository{
    func getProductList(page:Int, pageSize: Int, onSuccess: @escaping (ProductList) -> (), onFailure: @escaping (String) -> ())
    func getProductDetail(id:Int, onSuccess: @escaping (Product) -> (), onFailure: @escaping (String) -> ())
}
