import UIKit

// Отвечает за вход пользователя в систему

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var signIn: LoadingButton!
    
    // MARK: - Private properties
    
    private var authRequest: AuthRequestFactory!
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authRequest = RequestFactory().makeAuthRequestFatory()
    }
    
    // MARK: - IBAction
    
    @IBAction func loginTouchUpInside(_ sender: UIButton) {
        guard let name = loginTextField.text, let password = passwordTextField.text else {
            return
        }
        startAnimations()
        authRequest.login(userName: name, password: password) {[weak self] (result) in
            DispatchQueue.main.async {
                self?.stopAnimations()
            }
            if let user = result.value?.user {
                AppState.shared.user = user
                DispatchQueue.main.async {
                    self?.performSegue(withIdentifier: SegueIdentifiers.showProducts, sender: nil)
                }
            }
        }
    }
    
    // MARK: - Private methods
    
    private func startAnimations() {
        signIn.showLoading()
    }
    
    private func stopAnimations() {
        signIn.hideLoading()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.userInformation,
            let userVC = segue.destination as? UserViewController,
            let user = sender as? User {
            userVC.user = user
        }
    }
}
