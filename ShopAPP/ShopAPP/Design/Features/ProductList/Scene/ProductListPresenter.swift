import Foundation

protocol ProductListPresenter {
    func getProductList()
    func getNextProductList()
    func canGoNextPage() -> Bool
    func goNextPageThenUpdateIndex()
}

class ProductListPresenterImplementation : ProductListPresenter {
    private var getProductListUseCase: GetProductListUseCase
    private var view : ProductListView?
    
    private let pageSize = 2
    private var currentPage = 1
    private var totalPageSize = 1
    private var pagesForScrolling = 1
    
    init( getProductListUseCase: GetProductListUseCase = GetProductListUseCaseImplementation() ){
        self.getProductListUseCase = getProductListUseCase
    }
    
    func viewDidAppear(){
        view?.showLoading()
        getProductList()
    }
    
    func getProductList(){
        self.getProductListUseCase.execute(page: currentPage, pageSize: pageSize, completion: { productList in
            self.totalPageSize = productList.getSizeTotalPage()
            self.setPaginationIndex()
            self.view?.hideLoading()
            self.view?.showProduct(productListDomain: productList)
        })
    }
    
    private func setPaginationIndex(){
        self.pagesForScrolling = totalPageSize / pageSize
    }
    
    func setupView(_ view: ProductListView){
        self.view = view
    }
    
    func getNextProductList(){
        self.getProductListUseCase.execute(page: currentPage, pageSize: pageSize, completion: { productList in
            self.view?.showNextListProucts(productListDomain: productList)
        })
    }
    
    func canGoNextPage() -> Bool{
        return currentPage < pagesForScrolling ? true : false
    }
    
    func goNextPageThenUpdateIndex(){
        self.currentPage += 1
    }
    
    func showLoading(){
        self.view?.showLoading()
    }
    
    func stopLoading(){
        self.view?.hideLoading()
    }
}
