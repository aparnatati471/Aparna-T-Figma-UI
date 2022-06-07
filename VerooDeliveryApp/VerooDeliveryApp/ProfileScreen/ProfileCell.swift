import UIKit

// MARK: Custom Cell Class
class ProfileCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var lblItemTitle: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    
    /// This is for cell configuration of Profile screen
    static func cellConfiguration(cell: ProfileCell, indexPath: IndexPath) {
        cell.imgItem.image = UIImage.init(resource: Data.profileData[indexPath.row].image)
        cell.lblItemTitle.text = Data.profileData[indexPath.row].title
    }

}
