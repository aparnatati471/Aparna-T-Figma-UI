import UIKit

class OnboardingCell: UICollectionViewCell {
    
    // MARK: Outletes
    @IBOutlet weak var lblSubTitle: H5Label!
    @IBOutlet weak var lblTitle: H3Label!
    @IBOutlet weak var imgItem: UIImageView!
    
    ///This is for cell configuartion of collectionview
    static func cellConfiguration(cell: OnboardingCell, indexPath: IndexPath) {
        cell.imgItem.image = UIImage.init(resource: Data.onBoardingData[indexPath.row].image)
        cell.lblTitle.text = Data.onBoardingData[indexPath.row].title
        cell.lblSubTitle.text = Data.onBoardingData[indexPath.row].subtitle
    }
    
}
