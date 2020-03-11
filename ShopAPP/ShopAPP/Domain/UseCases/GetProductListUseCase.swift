import Foundation

protocol GetProductListUseCase {
    func execute(page:Int, pageSize: Int, completion: @escaping (ProductList) -> () )
}

class GetProductListUseCaseImplementation : GetProductListUseCase {
    private let repository: APIRepository
    
    init(repository: APIRepository = APIRepositoryImplementation()) {
        self.repository = repository
    }
    
    func execute(page:Int, pageSize: Int, completion: @escaping (ProductList) -> () ){
        self.repository.getProductList(page:page, pageSize:pageSize, completion: completion)
    }
}
