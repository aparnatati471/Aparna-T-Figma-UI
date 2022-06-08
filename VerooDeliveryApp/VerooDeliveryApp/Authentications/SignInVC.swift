import UIKit

class SignInVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tfPassword: CustomPasswordTextField!
    @IBOutlet weak var tfEmail: CustomTextField!
    
    // MARK: Overridden Method
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.delegate = self
        tfPassword.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
}

// MARK: SignInVC Extension which conforms UITextFieldDelegate
extension SignInVC: UITextFieldDelegate {
    
    func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
            case tfEmail:
                tfPassword.becomeFirstResponder()
            default:
                tfPassword.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
    
}
