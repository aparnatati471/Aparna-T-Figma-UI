//
//  NotificationManager.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 10/06/22.
//

import Foundation
import UserNotifications

class NotificationManager: UNMutableNotificationContent {
    
    var notificationCenter = UNUserNotificationCenter.current()
    var content = UNMutableNotificationContent()

    init(title: String, subtitle: String, body: String) {
        super.init()
        self.title = title
        self.subtitle = subtitle
        self.body = body
        self.sound = UNNotificationSound.default
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createNotification() {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2.0, repeats: false)
        let request = UNNotificationRequest(identifier: "ContentIdentifier", content: self, trigger: trigger)
        notificationCenter.delegate = self
        notificationCenter.add(request) { (error) in
            if error != nil {
                print("error \(String(describing: error))")
            }
        }
    }
    
    func addAttachment(resource: String, ext: String) -> Self {
        let attachement = try! UNNotificationAttachment(identifier: "image",
        url: Bundle.main.url(forResource: resource, withExtension: ext)!, options: nil)
        self.attachments = [attachement]
        return self
    }
    
    func addAction(myactions: [UNNotificationAction]) -> Self {
        let notificationCategory = UNNotificationCategory.init(identifier: "", actions: myactions, intentIdentifiers: [], options: [])
        notificationCenter.setNotificationCategories([notificationCategory])
        return self
    }
    
    static func action(identifier: String, title: String, option: UNNotificationActionOptions) -> UNNotificationAction {
        return UNNotificationAction.init(identifier: identifier, title: title, options: option)
    }
    
}


extension NotificationManager: UNUserNotificationCenterDelegate {
 
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .banner, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
            case "Accept":
                print("Accepted")
            case "Decline":
                print("Declined")
            default:
                print("Default")
        }
    }
    
}

