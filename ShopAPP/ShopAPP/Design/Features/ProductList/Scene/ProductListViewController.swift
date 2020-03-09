import UIKit

protocol ProductListView: class {
    func setLabel(text: String)
}

class ProductListViewController : UIViewController {
    var presenter: ProductListPresenterImplementation?
    let configurator = ProductListConfigurator()
    
    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(controller: self)
    }
    
    private func setupView(){
        presenter?.setupView(self)
    }
    
}
extension ProductListViewController: ProductListView{
    func setLabel(text: String) {
        self.label.text = text
    }
}
