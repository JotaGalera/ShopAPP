import Foundation

class ProductDataMapper {
    func convert(dict: [String:Any] ) -> ProductData{
        return ProductData(dict: dict)
    }
    
    func convert(data: Data) -> ProductData?{
        var productData: ProductData?
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            guard let array = json as? [Any] else { return nil}
            for item in array{
                if let itemDict = item as? [String:Any]{
                    productData = ProductData(dict: itemDict)
                }
            }
        }
        return productData
    }
}
