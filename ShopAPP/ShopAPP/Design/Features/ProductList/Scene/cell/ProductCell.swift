import UIKit

class ProductCell: UITableViewCell {
    private var pictureData : Data?
    
    @IBOutlet var imageProduct: UIImageView!
    @IBOutlet var nameProduct: UILabel!
    @IBOutlet var priceProduct: UILabel!
    @IBOutlet var brandProduct: UILabel!
    
    
    func setupCell(productDesign: ProductDesign){
        self.imageProduct.getData(from: productDesign.imageCell, completion: { data,response,error  in
            guard let imageData = data else { return }
            DispatchQueue.main.sync {
                self.imageProduct.image = UIImage(data: imageData)
            }
            
        })
        nameProduct.text = productDesign.nameCell
        brandProduct.text = productDesign.textBrandLabel
        priceProduct.text = productDesign.textPriceLabel
    }
}
