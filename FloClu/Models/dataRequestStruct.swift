//
//  dataRequestStruct.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-29.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import Foundation
import UIKit


struct jsonstruct:Decodable {
    let id:String?
    let latitude:String?
    let longitude:String?
    let time_stamp:String?
    let userid = UserDefaults.standard.string(forKey: "myID")
    let username = UserDefaults.standard.string(forKey: "nameuser")
    let distance:String?
    
    
}


struct userdata:Decodable {
    let userid:String?
    let email:String?
    let username:String?
    
    
}

struct Post: Decodable {
    let title : String
    let detail : String
    let username : String
    
}

