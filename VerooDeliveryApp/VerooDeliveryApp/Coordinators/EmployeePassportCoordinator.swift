//
//  File.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import Foundation
import UIKit

class EmployeePassportCoordinator: CoodinatorProtocol {
    
    var navigationController: UINavigationController?
    
    // Initializer
    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    func start() {
        let vc = CreateEmployeeVC.instantiateFromStoryBoard(from: StoryBoards.employeePassport)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func finish() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
