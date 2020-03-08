import Foundation

class ProductDataMapper {
    func convertToDTO(dict: [String:Any] ) -> ProductData{
        return ProductData(dict: dict)
    }
    
    func convertToDTO(data: Data) -> ProductData{
        var productData: ProductData = ProductData(dict: [:])
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            guard let array = json as? [Any] else { return productData}
            for item in array{
                if let itemDict = item as? [String:Any]{
                    productData = ProductData(dict: itemDict)
                }
            }
        }
        return productData
    }
    
    func convert(dto: ProductData) -> ProductDomain{
        return ProductDomain(name: dto.name, brand: dto.brand, price: dto.price, currency: dto.currency, image: dto.image)
    }
}
