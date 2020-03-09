import Foundation

protocol ProductListPresenter {
     func getProductList()
}

class ProductListPresenterImplementation : ProductListPresenter {
    private var getProductListUseCase: GetProductListUseCase
    
    init( getProductListUseCase: GetProductListUseCase = GetProductListUseCaseImplementation() ){
        self.getProductListUseCase = getProductListUseCase
    }
    
    func getProductList(){
        self.getProductListUseCase.execute(completion: { productList in
            print(productList)
        })
    }
}
