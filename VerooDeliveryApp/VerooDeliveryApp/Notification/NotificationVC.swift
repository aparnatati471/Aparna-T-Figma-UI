//
//  NotificationVC.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 09/06/22.
//

import UIKit
import UserNotifications

class NotificationVC: BaseViewController<NotificationCoordinator, BaseViewModel> {

    var notification = NotificationManager(title: R.string.localizable.title(), subtitle: R.string.localizable.subtitle(), body: R.string.localizable.body())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    @IBAction func localNotificationClicked(_ sender: CustomButtonTwo) {
        var myactions = [UNNotificationAction]()
        myactions.append(NotificationManager.action(identifier: R.string.localizable.actionOne(), title: R.string.localizable.actionOne(), option: .foreground))
        myactions.append(NotificationManager.action(identifier: R.string.localizable.actionTwo(), title: R.string.localizable.actionTwo(), option: .destructive))
        notification.addAttachment(resource: "notification", ext: "png").addAction(myactions: myactions).createNotification()
    }

}

