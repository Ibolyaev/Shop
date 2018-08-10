import Foundation
import UIKit

protocol Alertable: class {
    func showAlertWithTitle(_ title: String, message: String)
}

extension Alertable where Self: UIViewController {
    func showAlertWithTitle(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }  
}
