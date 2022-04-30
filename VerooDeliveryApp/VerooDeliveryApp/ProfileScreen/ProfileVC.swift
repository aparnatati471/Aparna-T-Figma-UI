import UIKit

class ProfileVC: UIViewController {

    // Outlets
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var profileTableView: UITableView!
    
    // Variable
    var profileData = [ProfileDataClass]()
    
    // MARK: Overridden Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configureBarButton()
        setUpView()
    }
    
    /// This is for setting up view
    func setUpView() {
        self.view.backgroundColor = UIColor.viewBackgroundColor
        profileTableView.backgroundColor = UIColor.headerBackgroundColor
        roundedView.layer.cornerRadius = 20
    }
    
    /// This is for add bar button and title of that
    func configureBarButton() {
        let barButton = UIBarButtonItem(image: R.image.backArrow(), style: .done, target: self, action: #selector(backClicked))
        navigationController?.setTintColor(UIColor.labelTextColor)
        self.navigationItem.leftBarButtonItem = barButton
        self.navigationItem.title = "My Profile"
    }
    
    @objc func backClicked() {
        print("Back Clicked")
    }

}

// MARK: ProfileVC Extensions conforms UITableViewDataSource
extension ProfileVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = profileTableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.profileCell.identifier) as? ProfileCell else { return UITableViewCell() }
               ProfileCell.cellConfiguration(cell: cell, indexPath: indexPath)
               return cell
    }
    
}


