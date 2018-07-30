import UIKit

// Отвечает за регистрацию пользователя

class SignUpViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var password: UITextField!
    @IBOutlet var bio: UITextView!
    @IBOutlet var creditCard: UITextField!
    @IBOutlet var signUp: LoadingButton!
    
    // MARK: - Private properties
    
    private var user: User? {
        didSet {
            signUp.isEnabled = user?.filledCorrectly() ?? false
        }
    }
    private var authRequest: AuthRequestFactory!
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
        authRequest = RequestFactory().makeAuthRequestFatory()
    }
    
    // MARK: - IBAction
    
    @IBAction func signUpTouchUpInside(_ sender: UIButton) {
        guard let user = self.user else { return }
        
        startAnimations()
        authRequest.signUp(user: user) {[weak self] (reponse) in
            DispatchQueue.main.async {
                self?.stopAnimations()
            }
            if reponse.value?.result == 1 {
                DispatchQueue.main.async {
                    self?.performSegue(withIdentifier: SegueIdentifiers.userInformation, sender: user)
                }
            }
        }
    }
    
    // MARK: - Private methods
    
    private func startAnimations() {
        signUp.showLoading()
    }
    private func stopAnimations() {
        signUp.hideLoading()
    }
    private func updateUser() {
        self.user = User(id: 1,
                         login: "",
                         name: name.text ?? "",
                         lastname: "",
                         email: email.text ?? "",
                         gender: gender.titleForSegment(at: gender.selectedSegmentIndex) ?? "",
                         creditCard: creditCard.text ?? "",
                         bio: bio.text ?? "",
                         password: password.text ?? "")
    }
    
    private func setupTargets() {
        name.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange(_:)),
                       for: UIControlEvents.editingChanged)
        email.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange(_:)),
                       for: UIControlEvents.editingChanged)
        password.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange(_:)),
                       for: UIControlEvents.editingChanged)
        creditCard.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange(_:)),
                      for: UIControlEvents.editingChanged)
    }
    @objc private func textFieldDidChange(_ textField: UITextField) {
        updateUser()
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
