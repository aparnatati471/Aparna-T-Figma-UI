import UIKit

class ProfileVC: BaseViewController<ProfileCoordinator, BaseViewModel> {
    
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configureBarButton()
        setUpView()
        profileTableView.dataSource = self
    }
    
    @IBAction func navigateToNotes(_ sender: Any) {
        coordinator?.navigateToNotes()
    }
    
    func setUpView() {
        self.view.backgroundColor = UIColor.viewBackgroundColor
        headerView.backgroundColor = R.color.headerColor()
        headerView.layer.cornerRadius = 16
        profileTableView.backgroundColor = R.color.headerColor()
    }
    
    func configureBarButton() {
        let barButton = UIBarButtonItem(image: R.image.backArrow(), style: .done, target: self, action: #selector(backClicked))
        navigationController?.setTintColor(UIColor.labelTextColor)
        self.navigationItem.leftBarButtonItem = barButton
        self.navigationItem.title = R.string.localizable.myProfile()
    }
    
    @objc func backClicked() {
        navigationController?.popViewController(animated: true)
    }

}

extension ProfileVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = profileTableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.profileCell.identifier) as? ProfileCell else { return UITableViewCell() }
        ProfileCell.cellConfiguration(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}



