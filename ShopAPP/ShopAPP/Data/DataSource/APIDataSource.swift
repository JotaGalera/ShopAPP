import Alamofire
import Foundation

protocol APIDataSource {
    func getProductList(page:Int, pageSize: Int, completion: @escaping (Data)->() )
}

class APIDataSourceImplementation : APIDataSource{
    func getProductList(page:Int, pageSize: Int, completion: @escaping (Data)->() ){
        let url = APIDataSourceConfig.url
        let header = APIDataSourceConfig.header
        let parameters : [String: Any] = ["page":page, "pageSize":pageSize]
        
        Alamofire.request(url, parameters: parameters, headers: header).validate().responseData { response in
            switch response.result {
            case let .success(data):
                completion(data)
            case .failure(_):
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
