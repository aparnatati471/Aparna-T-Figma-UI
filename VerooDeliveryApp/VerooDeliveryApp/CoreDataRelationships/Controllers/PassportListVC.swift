//
//  PassportListVC.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import UIKit

class PassportListVC: UIViewController {

    @IBOutlet weak var tblPassport: UITableView!
    private let manager = PassportManager()
    var passportData: [Passports]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizable.passportTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        passportData = manager.getAllPassports()
        if(passportData?.count != 0 && passportData != nil) {
            self.tblPassport.reloadData()
        }
    }
    
}

extension PassportListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passportData?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblPassport.dequeueReusableCell(withIdentifier: R.reuseIdentifier.passportCell.identifier) as? PassportCell else { return UITableViewCell() }
        if let data = passportData {
            PassportCell.cellConfiguration(cell: cell, indexPath: indexPath, data: data)
        }
        return cell
    }
    
    
}
