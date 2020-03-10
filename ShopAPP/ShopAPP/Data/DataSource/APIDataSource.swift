import Alamofire
import Foundation

protocol APIDataSource {
    func getProductList( completion: @escaping (Data)->() )
}

class APIDataSourceImplementation : APIDataSource{
    func getProductList( completion: @escaping (Data)->() ){
        let url = APIDataSourceConfig.url
        let header = APIDataSourceConfig.header
        let parameters : [String: Any] = ["page":1, "pageSize":10]
        
        Alamofire.request(url, parameters: parameters, headers: header).validate().responseData { response in
            switch response.result {
            case let .success(data):
                completion(data)
            case let .failure(error):
                print("error")
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
