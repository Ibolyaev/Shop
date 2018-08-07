import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet var reviewTextLabel: UILabel!
    
    func configureWith(text: String) {
        reviewTextLabel?.text = text
    }    
}
