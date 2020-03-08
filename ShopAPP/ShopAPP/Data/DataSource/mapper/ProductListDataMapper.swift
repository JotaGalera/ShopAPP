import Foundation

class ProductListDataMapper {
    private let productDataMapper = ProductDataMapper()
    
    func convertToDTO(data: Data) -> ProductListData?{
        let productDataList = ProductListData(arrayProductData: [])
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            guard let array = json as? [Any] else { return nil}
            for item in array{
                if let itemDict = item as? [String:Any]{
                    let productData = productDataMapper.convertToDTO(dict: itemDict)
                    productDataList.addProductDataToList(productData: productData)
                }
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
