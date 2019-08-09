//
//  UITextView+Extension.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-29.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import Foundation

import UIKit

// MARK: - Methods
public extension UITextView {
    
    /// Scroll to the bottom of text view
    public func scrollToBottom() {
        let range = NSMakeRange((text as NSString).length - 1, 1)
        scrollRangeToVisible(range)
    }
    
    /// Scroll to the top of text view
    public func scrollToTop() {
        let range = NSMakeRange(0, 1)
        scrollRangeToVisible(range)
    }
}
