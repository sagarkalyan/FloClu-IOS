//
//  Logout.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-30.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class Settings: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logoutTap(_ sender: Any) {
        print("I am working 11111111=======================================check anagin")
        
        try! Auth.auth().signOut()
        print("I am working=======================================check anagin")
        UserDefaults.standard.removeObject(forKey: "myID")
        
        let MainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialNavigationController = MainStoryboard.instantiateInitialViewController() as! UINavigationController
        self.present(initialNavigationController, animated: true, completion: nil)
        
        //        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil) 
        
    }
}
