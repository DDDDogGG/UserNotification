//
//  ViewController.swift
//  UserNotification
//
//  Created by 姜伦 on 2017/11/8.
//  Copyright © 2017年 Django. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Configuring a Local Notification
    func makeALocalNotification() {
        let content = UNMutableNotificationContent()
        // Assign the category (and the associated actions).
        content.categoryIdentifier = "TIMER_EXPIRED"
        content.sound = UNNotificationSound.default()
        content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!",
                                                                arguments: nil)
        
        //  UNCalendarNotificationTrigger, UNTimeIntervalNotificationTrigger, UNLocationNotificationTrigger
        // Configure the trigger for a 7am wakeup.
        var dateInfo = DateComponents()
        dateInfo.hour = 7
        dateInfo.minute = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
        
        // Create the request object.
        let request = UNNotificationRequest(identifier: "MorningAlarm", content: content, trigger: trigger)
        
        // Schedule the request.
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in
            if let theError = error {
                print(theError.localizedDescription)
            }
        }
        
        // Cancel notification before it is delivered
        center.removePendingNotificationRequests(withIdentifiers: ["MorningAlarm"])
        center.removeAllPendingNotificationRequests()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

