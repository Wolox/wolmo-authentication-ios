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

public protocol ActionHandlerType {}

extension ActionHandlerType where Self: UIControl {
    
    public func setAction(events: UIControlEvents = .TouchUpInside, _ action: Self -> Void) {
        let handler = ActionHandler(action: action)
        self.addTarget(handler, action: "action:", forControlEvents: events)
        objc_setAssociatedObject(self, ActionHandlerTypeAssociatedObjectKey, handler, .OBJC_ASSOCIATION_RETAIN)
    }
    
}

extension UIControl: ActionHandlerType {}

private let ActionHandlerTypeAssociatedObjectKey = UnsafeMutablePointer<Int8>.alloc(1)

private class ActionHandler<T>: NSObject {
    private let action: T -> Void
    
    init(action: T -> Void) {
        self.action = action
    }
    
    @objc func action(sender: UIControl) {
        action(sender as! T)
    }
}