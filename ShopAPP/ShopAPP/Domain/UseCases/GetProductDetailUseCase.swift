import Foundation
protocol GetProductDetailUseCase{
    func execute(id: Int,
                 onSuccess: @escaping (Product)->(),
                 onFailure: @escaping (String)->() )
}


class GetProductDetailUseCaseImplementation: GetProductDetailUseCase {
    private let repository: APIRepository
    
    init(repository: APIRepository = APIRepositoryImplementation()) {
        self.repository = repository
    }
    
    func execute(id: Int, onSuccess: @escaping (Product) -> (), onFailure: @escaping (String)->() ){
        self.repository.getProductDetail(id: id, onSuccess: onSuccess, onFailure: onFailure)
    }
}
