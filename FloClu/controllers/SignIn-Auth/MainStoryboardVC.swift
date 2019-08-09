//
//  MainStoryboardVC.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-29.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn




class MainStoryboardVC: UIViewController, GIDSignInUIDelegate{
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButtonDesg: UIButton!
    
    
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBAction func signOutButton(_ sender: Any) {
        
        GIDSignIn.sharedInstance()?.disconnect()
        print("=================discvonnected=====================")
        view.reloadInputViews()
    }
    
    //    @IBOutlet weak var soignOutButton: UIButton!
    //    @IBOutlet weak var signOutButton: UIButton!
    
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //         signup Design =====
//        signUpButton.layer.cornerRadius = 20
//        signUpButton.clipsToBounds = true
//        signUpButton.backgroundColor = color1
//
//
//        //        Login Design =====
//        loginButtonDesg.layer.cornerRadius = 20
//        loginButtonDesg.clipsToBounds = true
//        loginButtonDesg.backgroundColor = white
//        loginButtonDesg.layer.borderWidth = 3
//        loginButtonDesg.layer.borderColor = color1 as! CGColor
//
//
        
        
        // Do any additional setup after loading the view.
        //        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        //        GIDSignIn.sharedInstance().signIn()
        
        
        
    }
    
    
    
    @IBAction func signUpTap(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpScreen", sender: self)
    }
    
    @IBAction func loginTap(_ sender: Any) {
        self.performSegue(withIdentifier: "loginScreen", sender: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // [START_EXCLUDE]
            print(user as Any , "is the user ")
            // [END_EXCLUDE]
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
        
        super.viewDidAppear(animated)
        
        if let user = Auth.auth().currentUser {
            print(user)
            
            
            let homeScreenStoryboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
            let initialNavigationController = homeScreenStoryboard.instantiateInitialViewController() as! UINavigationController
            self.present(initialNavigationController, animated: true, completion: nil)
        }
    }
    
}

