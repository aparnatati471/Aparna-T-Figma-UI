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
        self.titleLabel?.font = R.font.readexProBold(size: 17)
        self.titleLabel?.textAlignment = .center
        self.layer.cornerRadius = 30
        self.backgroundColor = UIColor.buttonBackgroundColor
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
        self.titleLabel?.font = R.font.readexProRegular(size: 15)
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
        self.titleLabel?.font = R.font.readexProMedium(size: 20)
        self.tintColor = UIColor.buttonTextColor
        self.contentHorizontalAlignment = .left
    }
    
}

