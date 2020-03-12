import Foundation

class ProductListDataMapper {
    private let productDataMapper = ProductDataMapper()
    private var sizeTotalPage: Int = 0
    
    func convertToDTO(data: Data) -> ProductListData?{
        let productDataList = ProductListData(arrayProductData: [])
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            guard let array = json as? [String:Any] else { return nil }
            guard let numPageArray = array as? [String:Any] else { return nil }
            guard let sizePageString = numPageArray["size"] as? String else { return nil }
            self.sizeTotalPage = Int(sizePageString) ?? 0
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
        productList.setSizeTotalPage(sizeTotalPage)
        for i in array{
            let productDomain = Product(name: i.name, brand: i.brand, price: i.price, currency: i.currency, image: i.image)
            productList.addProductsToList(product: productDomain)
        }
        return productList
    }
}
