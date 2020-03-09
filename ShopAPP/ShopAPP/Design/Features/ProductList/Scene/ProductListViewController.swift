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
        setupView()
    }
    
    private func setupView(){
        presenter?.setupView(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
extension ProductListViewController: ProductListView{
    func setLabel(text: String) {
        self.label.text = text
    }
}
