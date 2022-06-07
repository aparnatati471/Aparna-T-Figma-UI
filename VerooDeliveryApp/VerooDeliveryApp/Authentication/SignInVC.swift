import UIKit

class SignInVC: UIViewController {

    // Outlets
    @IBOutlet weak var txtPassword: CustomPasswordTextField!
    @IBOutlet weak var txtEmail: CustomTextField!
    
    // MARK: Overridden Method
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.delegate = self
        txtPassword.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
}

// MARK: SignInVC Extension which conforms UITextFieldDelegate
extension SignInVC: UITextFieldDelegate {
    
    ///This is for go to next textfield using return keys
    func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
            case txtEmail:
                txtPassword.becomeFirstResponder()
            default:
                txtPassword.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
    
}
