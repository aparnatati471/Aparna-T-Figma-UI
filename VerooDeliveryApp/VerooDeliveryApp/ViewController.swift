import UIKit

class ViewController: BaseViewController<AuthenticatorCoordinator, BaseViewModel> {
    
    // Outlets
    @IBOutlet weak var signUpContainerView: UIView!
    @IBOutlet weak var signInContainerView: UIView!
    @IBOutlet weak var button: BottomButtons!
    @IBOutlet weak var btnSignIn: TopButtons!
    @IBOutlet weak var btnSignUp: TopButtons!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    // Variables
    var bottomBorder = CALayer()
    let thickness: CGFloat = 3.0
    var vm = AuthenticationViewModel()

    // MARK: Overridden Method
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpContainerView.isHidden = true
        self.view.backgroundColor = UIColor.viewBackgroundColor
        navigationController?.navigationBar.tintColor = UIColor.white
        getObservables()
        drawBottomLine(btnSignIn)
    }
    
    @IBAction func profileClicked(_ sender: UIButton) {
        coordinator?.navigateToProfile()
    }
    
    @IBAction func clicked(_ sender: ButtonBaseClass) {
        if(sender.titleLabel?.text == R.string.localizable.signInButtonTitle()) {
            let user = UserLoginRequest(email: "eve.holt@reqres.in", password: "cityslicka")
            vm.login(user: user)
        } else {
            let user = UserRegisterRequest(email: "eve.holt@reqres.in", password: "pistol")
            vm.register(user: user)
        }
    }
    
    // MARK: IBActions
    @IBAction func signUpClicked(_ : TopButtons) {
        signInContainerView.isHidden = true
        signUpContainerView.isHidden = false
        button.titleLabel?.text = R.string.localizable.signUpButtonTitle()
        drawBottomLine(btnSignUp)
    }
    
    @IBAction func signInClicked(_ sender: TopButtons) {
        signInContainerView.isHidden = false
        signUpContainerView.isHidden = true
        button.titleLabel?.text = R.string.localizable.signInButtonTitle()
        drawBottomLine(btnSignIn)
    }
    
    func getObservables() {
        vm.authenticationToken.bind { token in
            self.showAlert(title: "Success", message: "Now You can access \(String(describing: token))")
        }
        vm.failureMessage.bind { error in
            self.showAlert(title: "Failure", message: "Please try again \(String(describing: error))")
        }
        vm.isLoading.bind { visibility in
            if (visibility) {
                self.activityIndicatorView.startAnimating()
            } else {
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    
    // MARK: Class Method
    func drawBottomLine(_ btn: TopButtons) {
        UIView.animate(withDuration: 1.0, //1
            delay: 0.0, //2
            usingSpringWithDamping: 0.3, //3
            initialSpringVelocity: 1, //4
            options: UIView.AnimationOptions.curveEaseInOut, //5
            animations: ({ [weak self] in
            guard let `self` = self else { return }
            self.bottomBorder.frame = CGRect(x:0, y: btn.frame.size.height - self.thickness, width: btn.frame.size.width - self.thickness, height: self.thickness)
            self.bottomBorder.backgroundColor = UIColor.indicatorColor.cgColor
            btn.layer.addSublayer(self.bottomBorder)
        }), completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
   
}

