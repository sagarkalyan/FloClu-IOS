//
//  EmailSignUpVC.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-29.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import UIKit
import Firebase

class EmailSignUpVC: UIViewController, UITextFieldDelegate  {
    
    //    @IBOutlet var viewGradient: UIView!
    //    let color1 = UIColor(red: 48.0/255.0, green: 178.0/255.0, blue: 166.0/255.0, alpha: 1.0)
    //    let color2 = UIColor(red: 82.0/255.0, green: 96.0/255.0, blue: 169.0/255.0, alpha: 1.0)
    
    
    @IBOutlet weak var nameTextField: UITextField!
        

    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
   
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var passwordsUnmatchLabel: UILabel!
    var activityView:UIActivityIndicatorView!
    var continueButton : RoundedWhiteButton!
    
    
    

    
    
    
    
    
    @IBAction func loginScreen(_ sender: Any) {
        
        let signInScreen = self.storyboard?.instantiateViewController(withIdentifier: "loginScreen") as!SignInVC
        self.navigationController?.pushViewController(signInScreen, animated: true)
        //        self.present(nextTab, animated:true, completion:nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //    icons
        
        nameTextField.leftViewMode = UITextField.ViewMode.always
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView1.contentMode = .scaleAspectFit
        let image1 = UIImage(named: "user general")
        imageView1.image = image1
        nameTextField.leftView = imageView1
        
        emailTextField.leftViewMode = UITextField.ViewMode.always
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView2.contentMode = .scaleAspectFit
        let image2 = UIImage(named: "Group 300")
        imageView2.image = image2
        emailTextField.leftView = imageView2
//        let paddingView = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//        emailTextField.leftView = paddingView
//        emailTextField.leftViewMode = UITextField.ViewMode.always
        
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        let imageView3 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView3.contentMode = .scaleAspectFit
        let image3 = UIImage(named: "Group 308")
        imageView3.image = image3
        passwordTextField.leftView = imageView3
        
        confirmPasswordTextField.leftViewMode = UITextField.ViewMode.always
        let imageView4 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView4.contentMode = .scaleAspectFit
        let image4 = UIImage(named: "Group 308")
        imageView4.image = image4
        confirmPasswordTextField.leftView = imageView4
        
        
        
        //    icons ends
        
        
        
        
        //          view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        //
        
        continueButton = RoundedWhiteButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        continueButton.setTitleColor(secondaryColor, for: .normal)
        continueButton.setTitle("SIGN UP", for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
        continueButton.center = CGPoint(x: view.center.x, y: view.frame.height - continueButton.frame.height - 24)
        continueButton.highlightedColor = UIColor(white: 1.0, alpha: 1.0)
        continueButton.defaultColor = UIColor.white
        continueButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        view.addSubview(continueButton)
        setContinueButton(enabled: false)
        
        activityView = UIActivityIndicatorView(style: .gray)
        activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = continueButton.center
        
        view.addSubview(activityView)
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    @objc func keyboardWillAppear(notification: NSNotification){
        
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        continueButton.center = CGPoint(x: view.center.x,
                                        y: view.frame.height - keyboardFrame.height - 16.0 - continueButton.frame.height / 2)
        activityView.center = continueButton.center
    }
    
    
    @objc func textFieldChanged(_ target:UITextField) {
        let username = nameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        let formFilled = username != nil && username != "" && email != nil && email != "" && password != nil && password != "" && confirmPassword != nil && confirmPassword != "" && password == confirmPassword
        setContinueButton(enabled: formFilled)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Resigns the target textField and assigns the next textField in the form.
        
        switch textField {
        case nameTextField:
            nameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
            break
        case emailTextField:
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            break
        case passwordTextField:
            passwordTextField.resignFirstResponder()
            confirmPasswordTextField.becomeFirstResponder()
            break
        case confirmPasswordTextField:
            handleSignUp()
            break
        default:
            break
        }
        return true
    }
    
    
    func setContinueButton(enabled:Bool) {
        if enabled {
            continueButton.alpha = 1.0
            continueButton.isEnabled = true
        } else {
            continueButton.alpha = 0.5
            continueButton.isEnabled = false
        }
    }
    
    @objc func handleSignUp() {
        guard let username = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        
        setContinueButton(enabled: false)
        continueButton.setTitle("", for: .normal)
        activityView.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("User created!")
                
                
                //                let usernamefire = Auth.auth().currentUser!.displayName
                let userEmail = Auth.auth().currentUser!.email
                let userId = Auth.auth().currentUser!.uid
                print(userId,"======signup=====", userEmail as Any,
                      "==========================")
                print(username as Any , "==========================signup===============================")
                
                //                upload to sql
                
                
                
                let url = NSURL(string: "https://floclu.ca/insertfirebase.php")
                var request = URLRequest(url: url! as URL)
                request.httpMethod = "POST"
                
                var dataString = "secretWord=44fdcv8jf3"
                
                dataString = dataString + "&userid=\(String(describing: userId))"
                dataString = dataString + "&email=\(String(describing: userEmail))"
                dataString = dataString + "&username=\(String(describing: username))"
                
                print(dataString, "=================test=================")
                
                let dataD = dataString.data(using: .utf8) // convert to utf8 string
                
                do
                {
                    
                    // the upload task, uploadJob, is defined here
                    
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
                                            let alert = UIAlertController(title: "Upload OK?", message: "Looks like the upload and insert into the database worked.", preferredStyle: .alert)
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
                
                
                //                upload to sql end
                
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("User display name changed!")
                        
                        self.dismiss(animated: false, completion: nil)
                    } else {
                        
                        if let errCode = AuthErrorCode(rawValue: error!._code) {
                            
                            switch errCode {
                            case .emailAlreadyInUse:
                                print(" This email is already in use", ".....................................................")
                                
                                let alert = UIAlertController(title:"Email Laready Exist", message: "BC Email haigi a sade kol", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Email Wrong A Saliya", style: .default) { _ in })
                                
                                
                                self.present(alert, animated: true){}
                            default:
                                print("Create User Error: \(String(describing: error))")
                            }
                        }
                        print("Error: \(error!.localizedDescription)")
                        
                    }
                }
                
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    
    //    keyboard hide code
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        textField.resignFirstResponder()
    //
    //        return true
    //    }
    //
    
    //    keyboard hide code ends
    
}

