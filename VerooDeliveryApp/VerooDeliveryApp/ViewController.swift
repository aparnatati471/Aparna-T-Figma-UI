import UIKit

class ViewController: UIViewController, CoordinatorBoard {
    
    // Outlets
    @IBOutlet weak var signUpContainerView: UIView!
    @IBOutlet weak var signInContainerView: UIView!
    @IBOutlet weak var button: BottomButtons!
    @IBOutlet weak var btnSignIn: TopButtons!
    @IBOutlet weak var btnSignUp: TopButtons!
    
    // Variables
    weak var authenticatorCoordinator: AuthenticatorCoordinator?
    var bottomBorder = CALayer()
    let thickness: CGFloat = 3.0

    // MARK: Overridden Method
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpContainerView.isHidden = true
        self.view.backgroundColor = UIColor.viewBackgroundColor
        navigationController?.navigationBar.tintColor = UIColor.white
        drawBottomLine(btnSignIn)
    }
    
    @IBAction func profileClicked(_ sender: UIButton) {
        authenticatorCoordinator?.navigateToProfile()
    }
    
    // MARK: IBActions
    @IBAction func signUpClicked(_ sender: TopButtons) {
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
   
}

