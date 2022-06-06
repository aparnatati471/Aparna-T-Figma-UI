import UIKit

// MARK: Button Base Class
class ButtonBaseClass: UIButton {
    
    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

// MARK: Custom Button Class
class BottomButtons: ButtonBaseClass {
    
    // IBInspectable for button title
    @IBInspectable public var buttonTitle: String = "Button" {
        didSet {
            self.setTitle(buttonTitle, for: .normal)
        }
    }
    
    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpButton()
    }
    
    ///This is function for how the button looks
    func setUpButton() {
        self.layer.backgroundColor = UIColor.buttonBackgroundColor.cgColor
        self.layer.cornerRadius = 30
        self.titleLabel?.font = UIFont.init(name: R.font.readexProRegular.fontName, size: 17)
        self.tintColor = UIColor.black
    }

}

class CustomButtonTwo: ButtonBaseClass {

    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpButton()
    }
    
    ///This is function for how the button looks
    func setUpButton() {
        self.titleLabel?.font = UIFont.init(name: R.font.readexProRegular.fontName, size: 15)
        self.tintColor = UIColor.indicatorColor
    }

}

// MARK: Custom Button Class
class TopButtons: ButtonBaseClass {
    
    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpButton()
    }
    
    ///This is function for how the button looks
    func setUpButton() {
        self.titleLabel?.font = UIFont.init(name: R.font.readexProBold.fontName, size: 20)
        self.tintColor = UIColor.buttonTextColor
        self.contentHorizontalAlignment = .left
    }
    
}

