//
//  ShowsDataCoordinator.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 16/06/22.
//

import Foundation
import UIKit

class ShowsDataCoordinator: CoodinatorProtocol {
    
    var navigationController: UINavigationController?
    
    // Initializer
    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    func start() {
        let vc = ShowDataVC.instantiateFromStoryBoard(from: StoryBoards.coreData)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }

    func navigateToUpdateDeleteVC() {
        let vc = ShowDetailsCoordinator(with: navigationController ?? UINavigationController())
        vc.start()
    }
    
}
