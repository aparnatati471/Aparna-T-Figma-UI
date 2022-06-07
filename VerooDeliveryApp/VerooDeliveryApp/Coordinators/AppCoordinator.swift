//
//  AppCoordinator.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 06/05/22.
//

import UIKit

protocol CoodinatorProtocol {
    
    // MARK: Coodinator Protocol Methods & Properties
    var navigationController: UINavigationController? { get }
    func start()
    func finish()
    
}

class AppCoordinator: CoodinatorProtocol {
    
    // Variable
    var navigationController: UINavigationController?
    
    // Initializer
    init(with _navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    // Class Methods
    func start() {
        if(UserDefaults.standard.hasOnboarded == true) {
            let vc = AuthenticatorCoordinator(with: navigationController ?? UINavigationController())
            vc.start()
            print(UserDefaults.standard.hasOnboarded)
        } else {
            let vc = OnboardingVC.instantiateFromStoryBoard(from: StoryBoards.onboarding)
            vc.onboardingCoordinator = self
            navigationController?.pushViewController(vc, animated: true)
            print(UserDefaults.standard.hasOnboarded)

        }
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }
    
    /// This is for navigate to Authentication Screen
    func navigateToAutheticator() {
        let vc = AuthenticatorCoordinator(with: navigationController ?? UINavigationController())
        vc.start()
    }
    
}
