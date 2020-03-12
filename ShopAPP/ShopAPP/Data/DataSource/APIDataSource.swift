import Alamofire
import Foundation

protocol APIDataSource {
    func getProductList(page:Int, pageSize: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->() )
    
}

class APIDataSourceImplementation : APIDataSource{
    
    
    func getProductList(page:Int, pageSize: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->() ){
        let url = APIDataSourceConfig.url
        let header = APIDataSourceConfig.header
        let parameters : [String: Any] = ["page":page, "pageSize":pageSize]
        
        Alamofire.request(url, parameters: parameters, headers: header).validate().responseData { response in
            switch response.result {
            case let .success(data):
                onSuccess(data)
            case let .failure(error):
                onFailure("tucuTucu")
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
