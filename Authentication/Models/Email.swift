//
//  Email.swift
//  Authentication
//
//  Created by Daniela Riesgo on 3/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

/**
     Represents a valid email.
 */
public struct Email {
    
    public static func isValidEmail(_ raw: String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: raw)
    }
    
    public let raw: String
    
    public init?(raw: String) {
        guard Email.isValidEmail(raw) else {
            return nil
        }
        self.raw = raw
    }
    
}

public func == (left: Email, right: Email) -> Bool {
    return left.raw == right.raw
}
