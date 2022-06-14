//
//  NotesCoordinator.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 15/06/22.
//

import UIKit

class NotesCoordinator: CoodinatorProtocol {
    
    var navigationController: UINavigationController?
    
    // Initializer
    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    func start() {
        let vc = NotesVC.instantiateFromStoryBoard(from: StoryBoards.notes)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }

}
