import UIKit

// MARK: UIViewController Extension
extension UIViewController {
    
    ///Dismiss keyboad when we tap anywhere on the screen
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension UINavigationController {
    
    ///This is for set color of navigation bar
    func setTintColor(_ color: UIColor) {
        let navigationFont = UIFont(name: R.font.readexProMedium.fontName, size: 20)
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: navigationFont!]
        self.navigationBar.tintColor = color
    }

}

