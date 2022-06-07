import UIKit

// MARK: Custom View Class
class CustomView: UIView {
    
    // Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.backgroundColor = UIColor.viewBackgroundColor.cgColor
    }

}

