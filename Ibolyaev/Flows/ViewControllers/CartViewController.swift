import UIKit

class CartViewController: UIViewController, Trackable, Alertable {
    
    // MARK: - Identifiers
    
    let cartCellIdentifier = TableViewCellIdentifiers.cartCell
    
    // MARK: - IBOutlet
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Private properties
    
    private var user: User?
    private var cartRequest: CartRequestFactory!
    private var cartItems = [CartItem]()
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: Nibs.cartCell, bundle: nil), forCellReuseIdentifier: cartCellIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 90
        
        cartRequest = RequestFactory().makeCartRequestFactory()
        user = AppState.shared.user
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadCartItems()
    }
    
    // MARK: - IBAction
    
    @IBAction func payTouchUpInside(_ sender: UIButton) {
        checkOut()
    }
    
    // MARK: - Private methods
    
    private func loadCartItems() {
        guard let user = self.user else { return }
        
        cartRequest.get(user: user) {[weak self] (response) in
            guard let value = response.value else { return }
            
            self?.cartItems = value.contents
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func getTotalSum() -> Int {
        return cartItems.reduce(0) { $0 + $1.quantity * $1.price }
    }
    private func getTotalItems() -> Int {
        return cartItems.reduce(0) { $0 + $1.quantity }
    }
    
    private func checkOut() {
        performSegue(withIdentifier: SegueIdentifiers.checkOut, sender: nil)
    }
    
    private func removeProduct(_ product: Product) {
        cartRequest.remove(product: product) {[weak self] (response) in
            guard response.value != nil else { return }
            DispatchQueue.main.async {
                self?.showAlertWithTitle("Cart", message: "Item have been succesfully removed from the cart")
            }
            self?.track(.removeFromCart(product: product))
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.checkOut,
            let checkOutVC = segue.destination as? CheckOutViewController {
            checkOutVC.sum = getTotalSum()
            checkOutVC.items = getTotalItems()
        }
    }
}

extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cartCellIdentifier,
            for: indexPath) as? CartCell else {
                return UITableViewCell()
        }
        
        let cartItem = cartItems[indexPath.row]
        cell.delegate = self
        
        cell.configure(name: cartItem.productName,
                       qty: cartItem.quantity,
                       sum: cartItem.price * cartItem.quantity)
        
        return cell
    }
}

extension CartViewController: CartCellDelegate {
    func qtyDidChange(cell: CartCell, qty: Int) {        
        guard let indexPath = self.tableView.indexPath(for: cell) else { return }
        
        cartItems[indexPath.row].quantity = qty
        self.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
}
