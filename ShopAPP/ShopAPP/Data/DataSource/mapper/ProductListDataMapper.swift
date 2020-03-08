import Foundation

class ProductListDataMapper {
    private let productDataMapper = ProductDataMapper()
    
    func convert(data: Data) -> ProductListData?{
        let productDataList = ProductListData(arrayProductData: [])
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            guard let array = json as? [Any] else { return nil}
            for item in array{
                if let itemDict = item as? [String:Any]{
                    let productData = productDataMapper.convert(dict: itemDict)
                    productDataList.addProductDataToList(productData: productData)
                }
            }
        }
        return productDataList
    }
}
