import Foundation

class ProductDesign{
    let nameCell: String
    let imageCell: String
    let textPriceLabel: String
    let textBrandLabel: String
    
    init(product: ProductDomain){
        nameCell = product.name
        textPriceLabel = "\(product.price) \(product.currency)"
        textBrandLabel = product.brand
        imageCell = product.image
    }
}
