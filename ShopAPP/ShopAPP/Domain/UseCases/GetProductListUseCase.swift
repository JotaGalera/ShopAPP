import Foundation

protocol GetProductListUseCase {
    func execute( page:Int, pageSize: Int,
                 onSuccess: @escaping (ProductList)->(),
                 onFailure: @escaping (String)->() )
}

class GetProductListUseCaseImplementation : GetProductListUseCase {
    private let repository: APIRepository
    
    init(repository: APIRepository = APIRepositoryImplementation()) {
        self.repository = repository
    }
    
    func execute(page:Int, pageSize: Int, onSuccess: @escaping (ProductList)->(), onFailure: @escaping (String)->() ){
        self.repository.getProductList(page:page, pageSize:pageSize, onSuccess: onSuccess, onFailure: onFailure )
    }
}
