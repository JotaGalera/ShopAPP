import Foundation

protocol GetProductListUseCase {
    func execute(completion: @escaping (ProductList) -> () )
}

class GetProductListUseCaseImplementation : GetProductListUseCase {
    private let repository: APIRepository
    
    init(repository: APIRepository = APIRepositoryImplementation()) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (ProductList) -> () ){
        self.repository.getProductList(completion: completion)
    }
}
