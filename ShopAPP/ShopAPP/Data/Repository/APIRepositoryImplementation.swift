import Foundation

class APIRepositoryImplementation : APIRepository {
    private let dataSource : APIDataSource
    private let productListMapper = ProductListDataMapper()
    
    init(dataSource: APIDataSource = APIDataSourceImplementation()){
        self.dataSource = dataSource
    }
    
    func getProductList(completion: @escaping (ProductList) -> ()) {
        dataSource.getProductList(completion:{ response in
            guard let responseDTO = self.productListMapper.convertToDTO(data: response) else {return}
            completion(self.productListMapper.convert(dto: responseDTO))
        })
    }
}
