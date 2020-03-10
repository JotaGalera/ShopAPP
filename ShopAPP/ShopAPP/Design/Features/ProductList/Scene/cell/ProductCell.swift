import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet var imageProduct: UIImageView!
    @IBOutlet var nameProduct: UILabel!
    @IBOutlet var priceProduct: UILabel!
    @IBOutlet var brandProduct: UILabel!
    var pictureData : Data?
    
    func setupCell(productDesign: ProductDesign){
        getData(from: productDesign.imageCell, completion: { data,response,error  in
            guard let imageData = data  else { return }
            
            DispatchQueue.main.sync {
                self.imageProduct.image = UIImage(data: imageData)
            }
            
        })
        
        nameProduct.text = productDesign.nameCell
        brandProduct.text = productDesign.textBrandLabel
        priceProduct.text = productDesign.textPriceLabel
    }
    
    private func getData(from urlString: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
