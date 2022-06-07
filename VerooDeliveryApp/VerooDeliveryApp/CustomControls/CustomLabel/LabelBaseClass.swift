import UIKit

// MARK: Label Base Class
class LabelBaseClass: UILabel {
    
    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

// MARK: Label Custom Class
class H1Label: LabelBaseClass {
    
    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.font = UIFont(name: R.font.readexProRegular.fontName, size: 32)
        self.textColor = UIColor.labelTextColor
    }
    
}

// MARK: Label Custom Class
class H2Label: LabelBaseClass {

    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.font = UIFont(name: R.font.readexProLight.fontName, size: 17)
        self.textColor = UIColor.labelTextColor
    }

}

// MARK: Label Custom Class
class H3Label: LabelBaseClass {

    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.font = UIFont(name: R.font.readexProBold.fontName, size: 20)
        self.textColor = UIColor.labelTextColor
    }

}


// MARK: Label Custom Class
class H4Label: LabelBaseClass {

    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.font = UIFont(name: R.font.readexProExtraLight.fontName, size: 13)
        self.textColor = UIColor.labelTextColor
    }

}

// MARK: Label Custom Class
class H5Label: LabelBaseClass {

    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.font = UIFont(name: R.font.readexProMedium.fontName, size: 17)
        self.textColor = UIColor.labelTextColor
    }

}

