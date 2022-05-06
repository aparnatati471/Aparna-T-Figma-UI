import UIKit

// MARK: TextField Base Class
class TextFieldBaseClass: UITextField {
    
    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

// MARK: Custom TextField Class
class CustomTextField: TextFieldBaseClass {
    
    @IBInspectable var rightPadding: CGFloat = 0
    
    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpTextField()
    }
    
    ///This function for setup the textfield.
    func setUpTextField() {
        self.font = UIFont(name: R.font.readexProRegular.fontName, size: 17)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.textfieldBorderColor.cgColor
        self.textColor = UIColor.white
        self.backgroundColor = UIColor.textfieldBackgroundColor
    }
    
    //IBInspectable for placeholder color
    @IBInspectable public var placeholderColor: UIColor = UIColor.placeholderColor {
        didSet {
            let placeholderStr = placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor as Any])
        }
    }
    
    public override var placeholder: String? {
        didSet {
            let placeholderStr = placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor as Any])
        }
    }
    
    ///This is fucntion for adding padding between icon and textfield.
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 20, left: 22, bottom: 20, right: 20))
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 20, left: 22, bottom: 20, right: 20))
    }
    
    ///This is function for adding padding between text and textfield.
    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }
    
}
