//
//  AuthenticatorCoordinator.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 06/05/22.
//

import UIKit

class AuthenticatorCoordinator: CoodinatorProtocol {
    
    // Variable
    var navigationController: UINavigationController?
    
    // Initializer
    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    // Class Methods
    func start() {
        let vc = ViewController.instantiateFromStoryBoard(from: StoryBoards.main)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }

    /// This is for navigate to Profile Screen
    func navigateToProfile() {
        let vc = ProfileCoordinator(with: navigationController ?? UINavigationController())
        vc.start()
    }
    
    func navigateToNotification() {
        let vc = NotificationCoordinator(with: navigationController ?? UINavigationController())
        vc.start()
    }
    
    func navigateToUsersTasks() {
       // let vc = EmployeePassportCoordinator(with: navigationController ?? UINavigationController())
       // vc.start()
    }
    
    func navigateToCoreData() {
        let vc = CoreDataCoordinator(with: navigationController ?? UINavigationController())
        vc.start()
    }
    
}
