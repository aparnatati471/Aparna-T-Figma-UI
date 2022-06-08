import UIKit

class SignUpVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tfPassword: CustomPasswordTextField!
    @IBOutlet weak var tfPhoneNo: CustomTextField!
    @IBOutlet weak var tfEmail: CustomTextField!
    @IBOutlet weak var tfName: CustomTextField!
    
    // MARK: Overridden Method
    override func viewDidLoad() {
        super.viewDidLoad()
        tfName.delegate = self
        tfEmail.delegate = self
        tfPassword.delegate = self
        tfPhoneNo.delegate = self
        hideKeyboardWhenTappedAround()
    }

}

// MARK: SignUpVC Extension which conforms UITextFieldDelegate
extension SignUpVC: UITextFieldDelegate {
    
    func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
            case tfName:
                tfEmail.becomeFirstResponder()
            case tfEmail:
                tfPhoneNo.becomeFirstResponder()
            case tfPhoneNo:
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
