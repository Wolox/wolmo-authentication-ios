//
//  Extensions.swift
//  Authentication
//
//  Created by Daniela Riesgo on 3/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    func localized(arguments: CVarArgType...) -> String {
        return String(format: NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: ""), arguments: arguments)
    }
    
}

public extension UIButton {
    
    public func setUnderlinedTitle(title: String, style: NSUnderlineStyle = .StyleSingle, color: UIColor? = .None, forState state: UIControlState = .Normal) {
        var attributes: [String : AnyObject] = [NSUnderlineStyleAttributeName: style.rawValue]
        if let colorAttr = color {
            attributes[NSUnderlineColorAttributeName] = colorAttr
        }
        let underlinedText = NSAttributedString(string: title, attributes: attributes)
        setAttributedTitle(underlinedText, forState: state)

    }
    
}