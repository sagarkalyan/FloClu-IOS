//
//  PushNotificationSender.swift
//  FirebaseStarterKit
//
//  Created by Florian Marcu on 1/28/19.
//  Copyright © 2019 Instamobile. All rights reserved.
//

import UIKit

class PushNotificationSender {
    func sendPushNotification(to token: String, title: String, body: String, click_action: String) {
        let urlString = "https://fcm.googleapis.com/fcm/send"
//        let urlString = "api.sandbox.push.apple.com:443"
        let url = NSURL(string: urlString)!
        
        let paramString: [String : Any] = ["to" : token,
                                           "notification" : ["title" : title, "body" : body, "click_action" : click_action],
                                           "data" : ["user" : "test_id"]
        ]

        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject:paramString, options: [.prettyPrinted])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("key=AAAAAWEre7o:APA91bHHd59qD8D0DwF918cR_pYPLSn7tSOCsX7Pfub_B2dJ9x5qBSBWYSSZovUHHmSTc-K1Z-uY74dX_BpihmY3jSsSdktPeAteL2iAEcHxO9crWUBJXZW8geGitBxoAbKieZ56lWM_", forHTTPHeaderField: "Authorization")

        let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
            do {
                if let jsonData = data {
                    if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                        NSLog("Received data:\n\(jsonDataDict))")
                    }
                }
            } catch let err as NSError {
                print(err.debugDescription)
            }
        }
        task.resume()
    }
}
