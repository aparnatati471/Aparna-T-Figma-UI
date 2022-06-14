//
//  NotificationCoordinator.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 09/06/22.
//

import UIKit

class NotificationCoordinator: CoodinatorProtocol {
    
    var navigationController: UINavigationController?
    
    // Initializer
    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    func start() {
        let vc = NotificationVC.instantiateFromStoryBoard(from: StoryBoards.notification)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }

}
