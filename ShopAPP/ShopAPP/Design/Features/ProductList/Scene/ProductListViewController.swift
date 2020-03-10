import UIKit

protocol ProductListView: class {
    func showProduct(productListDomain: ProductList)
}

class ProductListViewController : UIViewController {
    var presenter: ProductListPresenterImplementation?
    private let configurator = ProductListConfigurator()
    private var productList : ProductList = ProductList(arrayProducts: [ProductDomain]())
    private let cellIdentifier = "ProductCell"
    
    @IBOutlet var tableProduct: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(controller: self)
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupView(){
        presenter?.setupView(self)
        setupTableView()
    }
    
    private func setupTableView(){
        tableProduct.dataSource = self
        tableProduct.delegate = self
        setupCellView()
    }
    
    private func setupCellView(){
        let nib = UINib.init(nibName: cellIdentifier, bundle: nil)
        tableProduct.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
}
extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProductCell
        let product = productList.getProductToList(index: indexPath.item)
        let productDesign = ProductDesign(product: product)
        cell.setupCell(productDesign: productDesign)
    
        return cell
    }
}
extension ProductListViewController: ProductListView{
    func showProduct(productListDomain: ProductList) {
        productList = productListDomain
        tableProduct.reloadData()
    }
}
