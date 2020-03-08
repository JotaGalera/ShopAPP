import Foundation

protocol GetProductListUseCase {
    func execute(completion: @escaping (ProductList) -> () )
}

class GetProductListUseCaseImplementation : GetProductListUseCase {
    func execute(completion: @escaping (ProductList) -> () ){
        
    }
}
