//
//  NotificationManager.swift
//  DeliveryTracker
//
//  Created by Pal Makkar on 8/11/22.
//

import Foundation
import RadarSDK
import MapKit

class LocalNotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    var notifications = [Notification]()
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted == true && error == nil {
                print("Notifications permitted")
            } else {
                print("Notifications not permitted")
            }
        }
        UNUserNotificationCenter.current().delegate = self
        
        }
    
    func sendNotification(title: String, subtitle: String?, body: String, launchIn: Double) {
            
            let content = UNMutableNotificationContent()
            content.title = title
            if let subtitle = subtitle {
                content.subtitle = subtitle
            }
            content.body = body
        
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: launchIn, repeats: false)
            let request = UNNotificationRequest(identifier: "demoNotification", content: content, trigger: trigger)
        
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            print("notification cued up!!")
    }
    
    func userNotificationCenter(
      _ center: UNUserNotificationCenter,
      willPresent notification: UNNotification,
      withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void
    ) {
        print("in the foreground notification")
        completionHandler(.banner)
    }
}

