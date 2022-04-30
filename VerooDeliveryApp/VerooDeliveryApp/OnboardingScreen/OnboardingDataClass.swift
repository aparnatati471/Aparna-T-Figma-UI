import UIKit
import Rswift

// MARK: Model for Onboarding screen
class OnboardingDataClass {
    
    var image: ImageResourceType
    var title: String
    var subtitle: String
    
    init(image: ImageResourceType, title: String, subtitle: String) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
    
}
