import Foundation

class ProductListDataMapper {
    private let productDataMapper = ProductDataMapper()
    //private let sizeTotal: Int?
    
    func convertToDTO(data: Data) -> ProductListData?{
        let productDataList = ProductListData(arrayProductData: [])
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            guard let array = json as? [String:Any] else { return nil }
            //guard self.sizeTotal = array["size"] as? Int ?? 0 as Int
            guard let elements = array["list"] as? [[String:Any]] else { return nil }
            for item in elements{
                let productData = productDataMapper.convertToDTO(dict: item)
                productDataList.addProductDataToList(productData: productData)
            }
        }
        return productDataList
    }
    
    func convert(dto: ProductListData) -> ProductList {
        let array = dto.getAllProductData()
        let productList = ProductList(arrayProducts: [])
        for i in array{
            let productDomain = ProductDomain(name: i.name, brand: i.brand, price: i.price, currency: i.currency, image: i.image)
            productList.addProductsToList(product: productDomain)
        }
        return productList
    }
}
