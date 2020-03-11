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
        self.getProductListUseCase.execute(page: 1, pageSize:1, completion: { productList in
            self.view?.showProduct(productListDomain: productList)
        })
    }
    
    func getNextProductList(){
        self.getProductListUseCase.execute(page: 2, pageSize:5, completion: { productList in
            self.view?.showNextListProucts(productListDomain: productList)
        })
    }
    
    func setupView(_ view: ProductListView){
        self.view = view
        getProductList()
    }
}
