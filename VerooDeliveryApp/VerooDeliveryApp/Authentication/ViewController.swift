import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var signUpContainerView: UIView!
    @IBOutlet weak var signInContainerView: UIView!
    @IBOutlet weak var button: BottomButtons!
    @IBOutlet weak var btnSignIn: TopButtons!
    @IBOutlet weak var btnSignUp: TopButtons!
    
    // Variables
    var bottomBorder = CALayer()
    let thickness: CGFloat = 3.0

    // MARK: Overridden Method
    override func viewDidLoad() {
        super.viewDidLoad()
        basicConfiguration()
    }
    
    // Class Method
    func basicConfiguration() {
        signUpContainerView.isHidden = true
        view.backgroundColor = UIColor.viewBackgroundColor
        button.setTitle(R.string.localizable.signInButtonTitle(), for: .normal)
        btnSignIn.titleLabel?.font = R.font.readexProBold(size: 20)
        btnSignUp.titleLabel?.font = R.font.readexProMedium(size: 18)
        drawBottomLine(btnSignIn)
    }
    
    // MARK: IBActions
    @IBAction func signUpClicked(_ sender: TopButtons) {
        btnSignUp.titleLabel?.font = R.font.readexProBold(size: 20)
        btnSignIn.titleLabel?.font = R.font.readexProMedium(size: 18)
        signInContainerView.isHidden = true
        signUpContainerView.isHidden = false
        button.setTitle(R.string.localizable.signUpButtonTitle(), for: .normal)
        drawBottomLine(btnSignUp)
    }
    
    @IBAction func signInClicked(_ sender: TopButtons) {
        btnSignIn.titleLabel?.font = R.font.readexProBold(size: 20)
        btnSignUp.titleLabel?.font = R.font.readexProMedium(size: 18)
        signInContainerView.isHidden = false
        signUpContainerView.isHidden = true
        button.setTitle(R.string.localizable.signInButtonTitle(), for: .normal)
        drawBottomLine(btnSignIn)
    }
    
    /// This is for drawing bottom line bottom of button
    func drawBottomLine(_ btn: TopButtons) {
        bottomBorder.frame = CGRect(x:0, y: btn.frame.size.height - thickness, width: btn.frame.size.width + thickness, height: thickness)
        bottomBorder.backgroundColor = UIColor.indicatorColor.cgColor
        btn.layer.addSublayer(bottomBorder)
    }
   
}

