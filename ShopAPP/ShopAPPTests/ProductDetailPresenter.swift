import Foundation

protocol ProductDetailPresenter {
    func getProductDetail()
}

class ProductDetailPresenterImplementation: ProductDetailPresenter {
    private var getProductDetailUseCase: GetProductDetailUseCase?
    
    init (getProductDetailUseCase: GetProductDetailUseCase = GetProductDetailUseCaseImplementation()){
        self.getProductDetailUseCase = getProductDetailUseCase
    }
    
    func getProductDetail(){
        getProductDetailUseCase?.execute(id: 1, onSuccess: { product in
            print("product")
        }, onFailure: { error in
            print("error")
        })
    }

}
