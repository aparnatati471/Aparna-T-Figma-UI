import UIKit

// MARK: Extension of UIColor
extension UIColor {
  
    static let defaultColor = UIColor.white
    static let viewBackgroundColor = R.color.mainViewBackgroundColor() ?? defaultColor
    static let textfieldBorderColor = R.color.textFieldBorderColor() ?? defaultColor
    static let textfieldBackgroundColor = R.color.textFieldBackgroundColor() ?? defaultColor
    static let placeholderColor = R.color.placeHolderColor() ?? defaultColor
    static let buttonBackgroundColor = R.color.buttonBackgroundColor() ?? defaultColor
    static let buttonTextColor = R.color.labelTextColor() ?? defaultColor
    static let labelTextColor = R.color.labelTextColor() ?? defaultColor
    static let indicatorColor = R.color.indicatorColor() ?? defaultColor
    
}

    
