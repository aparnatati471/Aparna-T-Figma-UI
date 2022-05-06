import UIKit

// MARK: Custom TextField Class
class CustomPasswordTextField: CustomTextField {
    
    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        rightIcon()
    }
    
    ///This function will add icon on right end of the Textfield
    public func rightIcon() {
        let eyeButton = UIButton()
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        eyeButton.addTarget(self, action: #selector(onEyeButtonClicked), for: .touchUpInside)
        eyeButton.isSelected = true
        eyeButton.frame = CGRect(x: 0, y: 0, width: 15, height: 12)
        eyeButton.tintColor = UIColor.white
        self.rightView = eyeButton
        self.rightViewMode = .always
    }
    
    @objc func onEyeButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = sender.isSelected
    }
    
}
