//
//  UISearchBar+extension.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-30.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    
    var textField: UITextField? {
        return value(forKey: "searchField") as? UITextField
    }
    
    func setSearchIcon(image: UIImage) {
        setImage(image, for: .search, state: .normal)
    }
    
    func setClearIcon(image: UIImage) {
        setImage(image, for: .clear, state: .normal)
    }
}
