//
//  ShowDetailsCoordinator.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 17/06/22.
//

import UIKit

class ShowDetailsCoordinator: CoodinatorProtocol {
    
    var navigationController: UINavigationController?
    
    // Initializer
    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    func start() {
        let vc = UpdateDeleteVC.instantiateFromStoryBoard(from: StoryBoards.coreData)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }
    
}
