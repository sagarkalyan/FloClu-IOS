//
//  addPosts.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-29.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import Foundation
import UIKit

class addPost: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var descriptionText: UITextView!
    
   
   
    
    @IBOutlet weak var headingText: UITextField!
    @IBOutlet weak var SavePost: UIButton!
    var arrdata = [userdata]()
    
    
    @IBAction func postSaved(_ sender: Any) {
        
        
        if headingText.text!.isEmpty || descriptionText.text!.isEmpty || descriptionText.textColor == UIColor.lightGray
        {
            SavePost.isEnabled = false
            
            let alert = UIAlertController(title: "Title or Description is empty", message: "Looks like the title or description field is empty.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
            return
            
        }
        
        //        SavePost.isEnabled = true
        //        SavePost.layer.cornerRadius = 10
        //        SavePost.clipsToBounds = true
        //        SavePost.backgroundColor = white
        //        SavePost.layer.borderWidth = 3
        //        SavePost.layer.borderColor = color1.cgColor
        //
        //
        
        //        get data
        let myId =  UserDefaults.standard.string(forKey: "myID")
        let usenam = UserDefaults.standard.string(forKey: "nameuser")
        print(myId as Any,"==========================from data====================")
        let url = URL(string: "https://floclu.ca/retrievefirebase.php")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.arrdata = try JSONDecoder().decode([userdata].self, from: data!)
                
                for element in self.arrdata{
                    let checkId = element.userid
                    
                    print(checkId as Any ,"==================to data============================")
                    
                    if myId == checkId
                    {
                        //                upload to sql
                        
                        
                        
                        let url = NSURL(string: "https://floclu.ca/insertposts.php")
                        var request = URLRequest(url: url! as URL)
                        request.httpMethod = "POST"
                        
                        var dataString = "secretWord=44fdcv8jf3"
                        
                        DispatchQueue.main.async
                            {
                                dataString = dataString + "&title=\(String(self.headingText.text!))"
                                dataString = dataString + "&detail=\(String(self.descriptionText.text))"
                                dataString = dataString + "&userid=\(String(myId!))"
                                dataString = dataString + "&username=\(String(usenam!))"
                                
                        }
                        
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
                        
                    }
                    else
                        
                    {
                        //                        self.toastMessage("Invalid User.")
                        print("error occured.")
                    }
                    
                }
                }
                
            }catch let jsonErr
                
            {
                print("Error Serialize", jsonErr)
            }
            
            }.resume()
        
        
        //        get data end
        
        
        
        //        self.navigationController?.popViewController(animated: true)
        
    }
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        SavePost.isEnabled = false
        SavePost.layer.cornerRadius = 10
        SavePost.clipsToBounds = true
        SavePost.backgroundColor = UIColor.white
        SavePost.layer.borderColor = color3.cgColor
        SavePost.layer.borderWidth = 3
        SavePost.titleLabel?.textColor = UIColor.lightGray
        
        
        //        SavePost.layer.cornerRadius = 10
        //        SavePost.clipsToBounds = true
        //        SavePost.backgroundColor = white
        //        SavePost.layer.borderWidth = 3
        //        SavePost.layer.borderColor = color1.cgColor
        
        headingText.layer.cornerRadius = 20
        headingText.layer.borderWidth = 1
        headingText.layer.borderColor = color5.cgColor
        
        descriptionText.layer.cornerRadius = 20
        descriptionText.layer.borderWidth = 1
        descriptionText.layer.borderColor =  color3.cgColor
        
        
        
        
        
        
        
    }
    
    //    text view padding start
    
    class UITextViewPadding : UITextView {
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            textContainerInset = UIEdgeInsets(top: 8, left: 6, bottom: 8, right: 4)
        }
    }
    
    //    text view padding ends
    
    
    
    //    keyboard hide code
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    //      keyboard hide code ends
    
    
}




extension addPost: UITextViewDelegate {
    //
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("woriknug============================================")
        
        if descriptionText.textColor == UIColor.black {
            descriptionText.text = nil
            descriptionText.textColor = UIColor.black
            
            
            
            
            print("woriknug==============================flknlkgnkljgkl;gfjmfgkkfgdjk==============")
            
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionText.text.isEmpty {
            descriptionText.text = "Description"
            descriptionText.textColor = UIColor.darkGray
        }
        
        
    }
}
