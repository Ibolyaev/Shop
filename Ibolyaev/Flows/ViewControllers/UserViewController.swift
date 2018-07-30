import UIKit

// Отвечает за отображение информации о пользователе и за обновление информации

class UserViewController: UIViewController {
    
    
    // MARK: - Custom types
    
    // MARK: - Identifiers
    // MARK: - Constants
    // MARK: - IBOutlet
    
    @IBOutlet var login: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var password: UITextField!
    @IBOutlet var bio: UITextView!
    @IBOutlet var creditCard: UITextField!
    @IBOutlet var update: LoadingButton!
    
    // MARK: - Public properties
    
    var user: User?
    
    // MARK: - Private properties
    
    private var userDataRequest: UserDataRequestFactory!
    // MARK: - Init
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDataRequest = RequestFactory().makeUserDataRequestFatory()
        loadUserInformation()
    }
    
    // MARK: - IBAction
    @IBAction func updateTouchUpInside(_ sender: LoadingButton) {
        guard let user = self.user else { return }
        
        startAnimations()
        userDataRequest.update(user: user) {[weak self] (reponse) in
            DispatchQueue.main.async {
                self?.stopAnimations()
            }
            if reponse.value?.result == 1 {
                // Success
            }
        }
    }
    // MARK: - Public methods
    // MARK: - Private methods
    func loadUserInformation() {
        guard let user = user else { return }
        
        login.text = user.login
        name.text = user.name
        email.text = user.email
        password.text = user.password
        bio.text = user.bio
        creditCard.text = user.creditCard
        gender.selectedSegmentIndex = user.gender == "m" ? 0 : 1
    }
    private func startAnimations() {
        update.showLoading()
    }
    private func stopAnimations() {
        update.hideLoading()
    }
    // MARK: - Navigation
    
}
