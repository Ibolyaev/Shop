import UIKit

class ProductCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!
    
    // MARK: - Public methods
    
    func configWith(name: String, price: Int) {
        self.name.text = name
        self.price.text = getFormatted(price: price)
    }
    
    // MARK: - Private methods
    
    private func getFormatted(price: Int) -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        return currencyFormatter.string(from: NSNumber(value: price))
    }
    
}
