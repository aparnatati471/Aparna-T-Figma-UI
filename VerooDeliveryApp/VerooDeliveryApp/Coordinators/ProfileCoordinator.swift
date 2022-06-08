//
//  ProfileCoordinator.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 06/05/22.
//

import UIKit

class ProfileCoordinator: CoodinatorProtocol {
    
    // Variable
    var navigationController: UINavigationController?
    
    // Initializer
    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    // Class Methods
    func start() {
        let vc = ProfileVC.instantiateFromStoryBoard(from: StoryBoards.profile)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }
    
}
