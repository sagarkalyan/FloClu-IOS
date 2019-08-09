//
//  HomeStoryboardVC.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-29.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import UserNotifications

class HomeStoryboardVC: UIViewController {
    
    @IBOutlet weak var settingButtonClicked: UIBarButtonItem!
    
    

  
    @IBOutlet weak var userProfile: UIBarButtonItem!
    
    private var pushManager: PushNotificationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        let userID = (Auth.auth().currentUser?.uid)!
        print(userID)
        tokenData = []
        
        // PN Firebase Start
        
        // Saving token to FC DB
        pushManager = PushNotificationManager(userID: userID, delegate: self)
        pushManager.registerForPushNotifications()
        
        // getting tokens
        let db = Firestore.firestore()
        db.collection("users").getDocuments { (snapshot, error) in
            if error != nil {
                print(error as Any)
            } else {
                for document in (snapshot?.documents)! {
                    if let name = document.data()["fcmToken"] as? String {
                        print(name)
//                        print("Getting data working...")
                        
                        tokenData.append(name)
                        
                    }
                }
            }
        }
        //PN Firebase End
        
    }
    
    
    
    
    @IBAction func addPeriodButtonClicked(_ sender: Any) {
    }
}

extension HomeStoryboardVC: NotificationTappedDelegate {
    func userDidTapNotification() {
        self.performSegue(withIdentifier: "helpList", sender: self)
    }
}
