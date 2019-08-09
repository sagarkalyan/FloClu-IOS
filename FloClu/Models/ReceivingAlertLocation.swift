//
//  ReceivingAlertLocation.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-07-28.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import Foundation
import Firebase


func getLocationAlert() {
    let userID = (Auth.auth().currentUser?.uid)!
    print(userID)
    
    // PN Firebase Start
    
    alertUserLatitude = ""
    alertUserLongitude = ""
    alertUserToken = ""
    
    // getting tokens
    let db = Firestore.firestore()
    db.collection("alertLocation").getDocuments { (snapshot, error) in
        if error != nil {
            print(error)
        } else {
            for document in (snapshot?.documents)! {
                if let lat = document.data()["latitude"] as? String {
                    print("lat:  \(lat)")
                    alertUserLatitude = lat
                    print("Getting data working...")
                    
                }
                if let long = document.data()["longitude"] as? String {
                    print("long:  \(long)")
                    alertUserLongitude = long
                    print("Getting data working...")
                    
                }
                
                if let alrtTkn = document.data()["fcmToken"] as? String {
                    print("fcmToken:  \(alrtTkn)")
                    alertUserToken = alrtTkn
                    print("Getting data working...")
                    
                    PushNotificationSender().sendPushNotification(to: alrtTkn, title: "Request Accepted", body: "A user has accepted your request", click_action: "MEETING_INVITATION")
                    
                }
            }
            print("Getting Location of the Users who sent the Alert Notification")
            //                sender.sendPushNotification(to: tokenData[0], title: "Chl Peaa", body: "Kiddan praa")
            
        }
    }
}
