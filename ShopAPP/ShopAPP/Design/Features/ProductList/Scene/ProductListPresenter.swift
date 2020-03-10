import Foundation

protocol ProductListPresenter {
     func getProductList()
}

class ProductListPresenterImplementation : ProductListPresenter {
    private var getProductListUseCase: GetProductListUseCase
    private var view : ProductListView?
    
    init( getProductListUseCase: GetProductListUseCase = GetProductListUseCaseImplementation() ){
        self.getProductListUseCase = getProductListUseCase
    }
    
    func getProductList(){
        self.getProductListUseCase.execute(completion: { productList in
            self.view?.showProduct(productListDomain: productList)
        })
    }
    
    func setupView(_ view: ProductListView){
        self.view = view
        getProductList()
    }
}
