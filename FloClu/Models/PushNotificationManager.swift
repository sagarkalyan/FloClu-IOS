//
//  PushNotificationManager.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-07-23.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import Firebase
import FirebaseFirestore
import FirebaseMessaging
import UIKit
import UserNotifications

protocol NotificationTappedDelegate: class {
    func userDidTapNotification()
}



class PushNotificationManager: NSObject, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    let userID: String
    
    private weak var delegate: NotificationTappedDelegate?
    
    init(userID: String, delegate: NotificationTappedDelegate) {
        self.userID = userID
        self.delegate = delegate
        super.init()
    }
    
    func registerForPushNotifications() {
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
            // Define the custom actions.
            let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION",
                                                    title: "Accept",
                                                    options: UNNotificationActionOptions(rawValue: 0))
            let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION",
                                                     title: "Decline",
                                                     options: UNNotificationActionOptions(rawValue: 0))
            // Define the notification type
            let meetingInviteCategory =
                UNNotificationCategory(identifier: "MEETING_INVITATION",
                                       actions: [acceptAction, declineAction],
                                       intentIdentifiers: [],
                                       hiddenPreviewsBodyPlaceholder: "",
                                       options: .customDismissAction)
            // Register the notification type.
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.setNotificationCategories([meetingInviteCategory])
            // For iOS 10 data message (sent via FCM)
            Messaging.messaging().delegate = self
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            // Define the custom actions.
            let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION",
                                                    title: "Accept",
                                                    options: UNNotificationActionOptions(rawValue: 0))
            let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION",
                                                     title: "Decline",
                                                     options: UNNotificationActionOptions(rawValue: 0))
            // Define the notification type
            let meetingInviteCategory =
                UNNotificationCategory(identifier: "MEETING_INVITATION",
                                       actions: [acceptAction, declineAction],
                                       intentIdentifiers: [],
                                       hiddenPreviewsBodyPlaceholder: "",
                                       options: .customDismissAction)
            // Register the notification type.
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.setNotificationCategories([meetingInviteCategory])
        }
        UIApplication.shared.registerForRemoteNotifications()
        updateFirestorePushTokenIfNeeded()
    }
    
    func updateFirestorePushTokenIfNeeded() {
        if let token = Messaging.messaging().fcmToken {
            let usersRef = Firestore.firestore().collection("users").document(userID)
            usersRef.setData(["fcmToken": token], merge: true)
        }
    }
    
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print(remoteMessage.appData)
        
        
//        print("Its working now")
//        getLocationAlert()
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        updateFirestorePushTokenIfNeeded()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(response)
        print("I am Working..======================================")
        
        
        getLocationAlert()
        if let delegate = self.delegate {
            delegate.userDidTapNotification()
        }
        
        
        
        // Get the meeting ID from the original notification.
//        let userInfo = response.notification.request.content.userInfo
//        let meetingID = userInfo["MEETING_ID"] as! String
//        let userID = userInfo["USER_ID"] as! String
        
//         Perform the task associated with the action.
//        switch response.actionIdentifier {
//        case "ACCEPT_ACTION":
////            sharedMeetingManager.acceptMeeting(user: userID,
////                                               meetingID: meetingID)
//            print("Accepted")
//            getLocationAlert()
//            if let delegate = self.delegate {
//                delegate.userDidTapNotification()
//            }
//
////            DispatchQueue.main.sync {
////                getLocationAlert()
////            }
////            getLocationAlert()
////            }
////            let otherVC = sb.instantiateViewController(withIdentifier: "SettingsStoryboard")
//
//
//
//            break
//
//        case "DECLINE_ACTION":
////            sharedMeetingManager.declineMeeting(user: userID,
////                                                meetingID: meetingID)
//            print("Declined")
//            break
//
//            // Handle other actions…
//
//        default:
//            break
//        }
        

        


        
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
//        let acceptAction = UNNotificationAction(identifier: "accept", title: "Accept", options: [])
        
    }
}
