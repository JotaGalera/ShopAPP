import Foundation
protocol GetProductDetailUseCase{
    func execute(id: Int, completion: @escaping (Product) -> () )
}


class GetProductDetailUseCaseImplementation: GetProductDetailUseCase {
    private let repository: APIRepository
    
    init(repository: APIRepository = APIRepositoryImplementation()) {
        self.repository = repository
    }
    
    func execute(id: Int, completion: @escaping (Product) -> () ){
        
    }
}
