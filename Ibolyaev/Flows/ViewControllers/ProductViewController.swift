import UIKit

class ProductViewController: UIViewController {
    
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
    private var reviews = [String]()
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewsRequest = RequestFactory().makeReviewRequestFactory()
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateProductUI()
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
        tableView.estimatedRowHeight = 90
    }
    
    private func loadReviews() {
        // В текущем АПИ нет возможности получить список отзывов о товаре, возвращаем произвольный список
        reviews = ["Awesome", "Total crap !", "Looks nice"]
        tableView.reloadData()
    }
}

extension ProductViewController: UITableViewDataSource {
    
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
