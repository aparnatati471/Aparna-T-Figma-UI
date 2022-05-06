import UIKit

class SignUpVC: UIViewController {

    // Outlets
    @IBOutlet weak var txtPassword: CustomPasswordTextField!
    @IBOutlet weak var txtPhoneNo: CustomTextField!
    @IBOutlet weak var txtEmail: CustomTextField!
    @IBOutlet weak var txtName: CustomTextField!
    
    // MARK: Overridden Method
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
        txtPhoneNo.delegate = self
        hideKeyboardWhenTappedAround()
    }

}

// MARK: SignUpVC Extension which conforms UITextFieldDelegate
extension SignUpVC: UITextFieldDelegate {
    
    ///This is for go to next textfield using return keys
    func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
            case txtName:
                txtEmail.becomeFirstResponder()
            case txtEmail:
                txtPhoneNo.becomeFirstResponder()
            case txtPhoneNo:
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
