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
            let product = productList.getProductToList(index: 0)
            
            self.view?.setLabel(text: product.name)
        })
    }
    
    func setupView(_ view: ProductListView){
        self.view = view
        getProductList()
    }
}
