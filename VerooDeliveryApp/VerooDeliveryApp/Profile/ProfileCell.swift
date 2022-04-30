import UIKit

// MARK: Custom Cell Class
class ProfileCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    // Cell Configuration
    static func cellConfiguration(cell: ProfileCell, indexPath: IndexPath) {
        cell.itemImage.image = UIImage.init(resource: Data.profileData[indexPath.row].image)
        cell.itemTitle.text = Data.profileData[indexPath.row].title
    }

}
