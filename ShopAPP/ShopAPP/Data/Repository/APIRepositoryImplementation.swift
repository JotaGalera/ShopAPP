import Foundation

class APIRepositoryImplementation : APIRepository {
    private let dataSource : APIDataSource
    private let productListMapper = ProductListDataMapper()
    var pruebesita = ProductList(arrayProducts: [ProductDomain]())
    
    init(dataSource: APIDataSource = APIDataSourceImplementation()){
        self.dataSource = dataSource
    }
    
    func getProductList(completion: @escaping (ProductList) -> ()) {
        
        dataSource.getProductList(completion:{ response in
            guard let responseDTO = self.productListMapper.convertToDTO(data: response) else {return}
            self.pruebesita = self.productListMapper.convert(dto: responseDTO)
            completion(self.productListMapper.convert(dto: responseDTO))
        })
    }
}
