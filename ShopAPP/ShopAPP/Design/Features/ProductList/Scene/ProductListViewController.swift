import UIKit

protocol ProductListView: class {
    func showLoading()
    func hideLoading()
    func showProduct(productListDomain: ProductList)
    func showNextListProucts(productListDomain: ProductList)
}

class ProductListViewController : UIViewController {
    var presenter: ProductListPresenterImplementation?
    private let configurator = ProductListConfigurator()
    private var productList : ProductList = ProductList(arrayProducts: [Product]())
    private let cellIdentifier = "ProductCell"
    
    @IBOutlet var tableProduct: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(controller: self)
        setupView()
        
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = productList.count() - 1
        
        if indexPath.row == lastElement, presenter?.canGoNextPage() == true{
            presenter?.goNextPageThenUpdateIndex()
            presenter?.getNextProductList()
        }
    }
}
extension ProductListViewController: ProductListView{
    func showLoading() {
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
    }
    func showProduct(productListDomain: ProductList) {
        productList = productListDomain
        tableProduct.reloadData()
    }
    func showNextListProucts(productListDomain: ProductList){
        productList.addProductListToList(productList: productListDomain)
        tableProduct.reloadData()
    }
}
