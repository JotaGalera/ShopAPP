import Foundation

class ProductListConfigurator {
    func configure(controller: ProductListViewController){
        let getProductList = GetProductListUseCaseImplementation()
        
        controller.presenter = ProductListPresenterImplementation(getProductListUseCase: getProductList)
    }
}
