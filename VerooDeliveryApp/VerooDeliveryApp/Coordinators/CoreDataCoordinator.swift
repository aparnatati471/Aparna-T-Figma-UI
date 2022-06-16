//
//  CoreDataCoordinator.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 16/06/22.
//

import UIKit
import Foundation

class CoreDataCoordinator: CoodinatorProtocol {
    
    var navigationController: UINavigationController?
    
    // Initializer
    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    func start() {
        let vc = CoreDataVC.instantiateFromStoryBoard(from: StoryBoards.coreData)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }
    
    func navigateToShowData() {
        let vc = ShowsDataCoordinator(with: navigationController ?? UINavigationController())
        vc.start()
    }

}
