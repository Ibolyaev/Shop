import UIKit

class ProductsViewController: UITableViewController, Trackable {
    
    // MARK: - Identifiers
    
    let productCellIdentifier = TableViewCellIdentifiers.productCell
    
    // MARK: - Private properties
    
    private var products = [Product]()
    private var productsRequest: ProductsRequestFactory!
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: Nibs.productCell, bundle: nil), forCellReuseIdentifier: productCellIdentifier)
        productsRequest = RequestFactory().makeProductsRequestFactory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateProducts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        track(.contentView(content: .productList, id: nil))
    }
    
    // MARK: - Private methods
    
    private func updateProducts() {
        productsRequest.getList(category: 1, page: 1) {[weak self] (response) in
            guard let products = response.value else {
                return
            }
            self?.products = products
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: productCellIdentifier,
            for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        
        let product = products[indexPath.row]
        cell.configWith(name: product.name, price: product.price)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        performSegue(withIdentifier: SegueIdentifiers.showProduct, sender: product)
    }
    
    // MARK: - Navigation
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.showProduct,
            let productVC = segue.destination as? ProductViewController,
            let product = sender as? Product {
            productVC.product = product
        }
    }
}
