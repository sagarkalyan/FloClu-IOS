//
//  TextField.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-30.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import Foundation
import UIKit

open class TextField: UITextField {
    
    public typealias Config = (TextField) -> Swift.Void
    
    public func configure(configurate: Config?) {
        configurate?(self)
    }
    
    public typealias Action = (UITextField) -> Void
    
    fileprivate var actionEditingChanged: Action?
    
    // Provides left padding for images
    
    override open func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftViewPadding ?? 0
        return textRect
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: (leftTextPadding ?? 8) + (leftView?.width ?? 0) + (leftViewPadding ?? 0), dy: 0)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: (leftTextPadding ?? 8) + (leftView?.width ?? 0) + (leftViewPadding ?? 0), dy: 0)
    }
    
    
    public var leftViewPadding: CGFloat?
    public var leftTextPadding: CGFloat?
    
    
    public func action(closure: @escaping Action) {
        if actionEditingChanged == nil {
            addTarget(self, action: #selector(TextField.textFieldDidChange), for: .editingChanged)
        }
        actionEditingChanged = closure
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        actionEditingChanged?(self)
    }
}
