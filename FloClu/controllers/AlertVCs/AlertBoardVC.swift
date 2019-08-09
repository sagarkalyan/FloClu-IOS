//
//  AlertBoardVC.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-29.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

class AlertBoardVC: UIViewController {

    @IBOutlet weak var whatYouNeedLabel: UITextField!
    @IBOutlet weak var additionalComments: UITextField!
    
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    var latitude : String?
    var longitude : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
//        AccessibilityLocationNow()
        
        // Do any additional setup after loading the view.
    }

//    func AccessibilityLocationNow()
//    {
//        locManager.requestWhenInUseAuthorization()
//        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
//            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
//
//            currentLocation = locManager.location
//
//        }
//        latitude = "\(currentLocation.coordinate.longitude)"
//        longitude = "\(currentLocation.coordinate.latitude)"
//
//    }
    
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        
        let myId = UserDefaults.standard.string(forKey: "myID")
        let usenam = UserDefaults.standard.string(forKey: "nameuser")
        
        let need = self.whatYouNeedLabel.text
        print(need!)
        
        let sender = PushNotificationSender()
        PushNotificationSender().sendPushNotification(to: "c9Xj7MkVHfI:APA91bGGvoBlifLv3hFREYioXpm20RVKtWaqQb95Xua4VeCEoN_rm3WaDda-6Am4RH4C2UCkMll6VI12CV4c7LCekHOReOaKBjmwsyqdd0K_sbL5OD2AoJUjkfYxisA_F69JsFyhvi04", title: "Help Needed", body: "A user needs Pads", click_action: "dfvfdv")
        PushNotificationSender().sendPushNotification(to: "fyD-u1-2LUM:APA91bH_G4XLhs3Tovzz-nylUoQHyVscrb7AOZtVMX7InIXoeGpCdnULw2_Bs60xEj-BfyJocscM0g30QLXaSS5NXJcJs4gXv94bIrSsnHrfrXA05XK2DQsG4dYOjLsZJQ0obqR2BMc-", title: "xcvfghjkvgbhj", body: "A user needs Pads", click_action: "bvcvb")
        PushNotificationSender().sendPushNotification(to: "ft6XTeox6ZE:APA91bGagZBGAyJGnmi92PgSS_XUxEaIQkW2c_fVRRiONRw1riVvVP7zQYz-kS5ByHRhiywtcElxLLAZ02Hbhtsvi8Xd2Mt0UlhlBirIrEXKW8tFFdT_QblIeT7U3NmYg7OrF9yER0O7", title: "Help Needed", body: "A user needs Pads", click_action: "MEETING_INVITATION")
        PushNotificationSender().sendPushNotification(to: "ff0WHwDoJ38:APA91bEJb3YAtdEM7kXORKkDuAlgbx2FDbGauW-2JcEnSKAOPSVg4h0fY0jW44bYf8l9kzDMhWp3hky9KgMAnfrX8td0uCSnHdEnTzy21sw0fLvLX128w5ZDvKBi-4Pmf2guBsFivtAl", title: "Help Needed", body: "A user needs Pads", click_action: "MEETING_INVITATION")
        
//        for token in tokenData {
//            sender.sendPushNotification(to: token, title: "Help Needed!", body: "A user needs \(need!)", click_action: "MEETING_INVITATION")
//            print(token)
//            print("Alert Sent")
//        }
        
        
        
        let url = NSURL(string: "https://floclu.ca/recievenew.php") // locahost MAMP - change to point to your database server
        
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        
        var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
        
        
        
        locManager.requestWhenInUseAuthorization()
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){

            currentLocation = locManager.location

        }
        latitude = "\(currentLocation.coordinate.longitude)"
        longitude = "\(currentLocation.coordinate.latitude)"

//
//                print(myId!, "================================hasjddkk===============================")
        // the POST string has entries separated by &
        dataString = dataString + "&latitude=\(String(latitude!))"
        dataString = dataString + "&longitude=\(String(longitude!))"
        dataString = dataString + "&whatdoyouneed=\(whatYouNeedLabel.text!)" // add items as name and value
        dataString = dataString + "&comment=\(additionalComments.text!)"
        dataString = dataString + "&userid=\(String(myId!))"
        dataString = dataString + "&username=\(String(usenam!))"
//            dataString = dataString + "&item4=\(item4.text!)"
//            dataString = dataString + "&item5=\(item5.text!)"
//
        // convert the post string to utf8 format
        
        let dataD = dataString.data(using: .utf8) // convert to utf8 string
        
        do
        {
//
//            // the upload task, uploadJob, is defined here
//
            let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
            {
                data, response, error in

                if error != nil {

                    // display an alert if there is an error inside the DispatchQueue.main.async

                    DispatchQueue.main.async
                        {
                            let alert = UIAlertController(title: "Upload Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have Internet access?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                    }
                }
                else
                {
                    if let unwrappedData = data {

                        let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Response from web server hosting the database

                        if returnedData == "1" // insert into database worked
                        {

                            // display an alert if no error and database insert worked (return = 1) inside the DispatchQueue.main.async

                            DispatchQueue.main.async
                                {
//                                    let alert = UIAlertController(title: "Upload OK?", message: "Looks like the upload and insert into the database worked.", preferredStyle: .alert)
//                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                                    self.present(alert, animated: true, completion: nil)
                                    let alert = UIAlertController(title: "Alert Sent", message: "Please wait for users to accept your request!", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else
                        {
                            // display an alert if an error and database insert didn't worked (return != 1) inside the DispatchQueue.main.async

                            DispatchQueue.main.async
                                {

                                    let alert = UIAlertController(title: "Upload Didn't Work", message: "Looks like the insert into the database did not worked.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }
            }

            uploadJob.resume()
        }
        
        // Simple Alert after pressing the Alert Button
        //        self.simpleAlert(title: "Notification Sent", msg: "Someone will reach you out soon")
        
        let userID = (Auth.auth().currentUser?.uid)!
        print(userID)
        
        let latitude = self.latitude!
        let longitude = self.longitude!
        
        // Sending my location to db for other user to access
        let usersRef = Firestore.firestore().collection("alertLocation").document("location")
        usersRef.setData(["latitude": latitude], merge: true)
        usersRef.setData(["longitude": longitude], merge: true)
        
        
        // Sending my token for other user
        if let token = Messaging.messaging().fcmToken {
            let usersRef = Firestore.firestore().collection("alertLocation").document("token")
            usersRef.setData(["fcmToken": token], merge: true)
        }
        
        
        //        ============= Sending to other view Controller (HelpListViewController) ============
        
//        let detail:HomeStoryboardVC = self.storyboard?.instantiateViewController(withIdentifier: "asdf") as! HomeStoryboardVC
//        self.navigationController?.pushViewController(detail, animated: true)
//        let detail:HelpListViewController = self.storyboard?.instantiateViewController(withIdentifier: "helpList") as! HelpListViewController
//
//        self.navigationController?.pushViewController(detail, animated: true)
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    


}
