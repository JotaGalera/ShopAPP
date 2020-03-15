import Foundation

class APIRepositoryImplementation : APIRepository {
    private let dataSource : APIDataSource
    private let productListMapper = ProductListDataMapper()
    private let productDataMapper = ProductDataMapper()
    
    init(dataSource: APIDataSource = APIDataSourceImplementation()){
        self.dataSource = dataSource
    }
    
    func getProductList(page:Int, pageSize: Int, onSuccess: @escaping (ProductList) -> (), onFailure: @escaping (String) -> () ) {
        dataSource.getProductList(page: page, pageSize: pageSize,
        onSuccess: { response in
            guard let responseDTO = self.productListMapper.convertToDTO(data: response) else {return}
            onSuccess(self.productListMapper.convert(dto: responseDTO))
        },
        onFailure: { error in
            onFailure(error)
        })
    }
    
    func getProductDetail(id: Int, onSuccess: @escaping (Product) -> (), onFailure: @escaping (String) -> ()) {
        dataSource.getProductData(id:id ,
        onSuccess: { response in
            guard let responseDTO = self.productDataMapper.convertToDTO(data: response) else {return}
            onSuccess(self.productDataMapper.convert(dto: responseDTO))
        },
        onFailure: { error in
            onFailure(error)
        })
    }
    
}
