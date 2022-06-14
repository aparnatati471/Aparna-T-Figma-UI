//
//  UsersTasksCoordinator.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 15/06/22.
//

import Foundation
import UIKit

class UsersTasksCoordinator: CoodinatorProtocol {
    
    var navigationController: UINavigationController?
    
    // Initializer
    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    func start() {
        let vc = UsersTaskVC.instantiateFromStoryBoard(from: StoryBoards.tasksUser)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }

}
