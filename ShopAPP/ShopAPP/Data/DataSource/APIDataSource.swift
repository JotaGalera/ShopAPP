import Alamofire
import Foundation

protocol APIDataSource {
    func getProductList(page:Int, pageSize: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->() )
    func getProductData(id: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->() )
}

class APIDataSourceImplementation : APIDataSource{
    func getProductList(page:Int, pageSize: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->() ){
        let url = APIDataSourceConfig.getAllProducts
        let header = APIDataSourceConfig.header
        let parameters : [String: Any] = ["page":page, "pageSize":pageSize]
        
        Alamofire.request(url, parameters: parameters, headers: header).validate().responseData { response in
            switch response.result {
            case let .success(data):
                onSuccess(data)
            case let .failure(error):
                onFailure(error.localizedDescription)
            }
        }
    }
    
    func getProductData(id: Int, onSuccess: @escaping (Data) -> (), onFailure: @escaping (String) -> ()) {
        let url = APIDataSourceConfig.getProductId
        let header = APIDataSourceConfig.header
        let parameter : [String: Any] = ["id":id]
        
        Alamofire.request(url, parameters: parameter, headers: header).validate().responseData() { response in
            switch response.result {
            case let .success(data):
                onSuccess(data)
            case let .failure(error):
                onFailure(error.localizedDescription)
            }
        }
    }
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
            debugPrint("=======================================")
            debugPrint(self)
            debugPrint("=======================================")
        #endif
        return self
    }
}
