import UIKit

// Отвечает за вход пользователя в систему

class LoginViewController: UIViewController {

    // MARK: - Custom types
    
    // MARK: - Identifiers
    
    // MARK: - Constants
    
    // MARK: - IBOutlet
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var signIn: LoadingButton!
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var authRequest: AuthRequestFactory!
    
    // MARK: - Init
    
    
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
                DispatchQueue.main.async {
                    self?.performSegue(withIdentifier: SegueIdentifiers.userInformation, sender: user)
                }
            }
        }
    }
    
    @IBAction func signUpTouchUpInside(_ sender: UIButton) {
    }
    
    
    // MARK: - Public methods
    
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
