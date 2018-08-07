import UIKit

class ProductViewController: UIViewController, Trackable, Alertable {
    
    @IBAction func addToCartTouchUpInside(_ sender: UIButton) {
        guard let product = self.product else { return }
        addToCart(product, quantity: 1)
    }
    // MARK: - Identifiers
    
     let reviewCellIdentifier = TableViewCellIdentifiers.reviewCell
    
    // MARK: - IBOutlet
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var name: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var price: UILabel!
    
    // MARK: - Public properties
    
    var product: Product?
    
    // MARK: - Private properties
    
    private var reviewsRequest: ReviewRequestFactory!
    private var cartRequest: CartRequestFactory!
    private var reviews = [String]()
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateProductUI()
        reviewsRequest = RequestFactory().makeReviewRequestFactory()
        cartRequest = RequestFactory().makeCartRequestFactory()
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        track(.contentView(content: .product, id: (product?.id.description) ?? ""))
    }
    
    // MARK: - Private methods
    
    private func updateProductUI() {
        name.text = product?.name
        price.text = product?.price.description
        
        loadReviews()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: Nibs.reviewCell, bundle: nil), forCellReuseIdentifier: reviewCellIdentifier)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 0
    }
    
    private func loadReviews() {
        // В текущем АПИ нет возможности получить список отзывов о товаре, возвращаем произвольный список
        reviews = ["Awesome", "Total crap !", "Looks nice"]
        tableView.reloadData()
    }
    
    private func addToCart(_ product: Product, quantity: Int) {
        cartRequest.add(product: product, quantity: quantity) {[weak self] (response) in
            guard response.value != nil else { return }
            self?.track(.addToCart(product: product))
            DispatchQueue.main.async {
                self?.showAlertWithTitle("Cart", message: "Item have been succesfully added to the cart")
            }
        }
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        
        headerView.textLabel?.textColor = Colors.text
    }
}

extension ProductViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Reviews"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reviewCellIdentifier,
            for: indexPath) as? ReviewCell else {
                return UITableViewCell()
        }
        
        let review = reviews[indexPath.row]
        cell.configureWith(text: review)
        
        return cell
    }
}
