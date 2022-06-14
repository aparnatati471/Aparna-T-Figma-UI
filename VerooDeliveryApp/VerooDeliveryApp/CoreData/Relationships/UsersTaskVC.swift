//
//  UsersTaskVC.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 15/06/22.
//

import UIKit

class UsersTaskVC: BaseViewController<UsersTasksCoordinator, BaseViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createClicked(_ sender: CustomButtonTwo) {
        addData()
    }
    
    func addData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let task1 = Task(context: managedContext)
        task1.id = 1
        task1.name = "NSObject"
        task1.details = "NSObject NSObject NSObject"
        
        let task2 = Task(context: managedContext)
        task1.id = 1
        task1.name = "NSObject1"
        task1.details = "NSObject1 NSObject1 NSObject1"
        
        let passport = Passport(context: managedContext)
        passport.number = "MYPASSPORTNUMBER"
        passport.expiryDate = Date()
        
        let user = User(context: managedContext)
        user.userid = 123
        user.name = "Aparna"
        
        user.tasks = NSSet.init(array: [task1, task2])
    
        user.toPassport = passport
        
        do {
            try managedContext.save()
            print("Saved")
        } catch let error as NSError {
            print(error.userInfo)
        }
    }
    
}
