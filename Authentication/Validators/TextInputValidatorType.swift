//
//  TextInputValidatorType.swift
//  Authentication
//
//  Created by Daniela Riesgo on 3/16/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

/**
     Represents any possible validation result:
     valid, or invalid with any possible quantity of errors.
 */
public enum ValidationResult {
    
    case valid
    case invalid(errors: [String])
    
    public var isValid: Bool {
        switch self {
        case .valid: return true
        case .invalid(_): return false
        }
    }
    
    public var errors: [String] {
        switch self {
        case .valid: return []
            // swiflint:disable indetifier_name
        case .invalid(let innerErrors): return innerErrors
        }
    }
    
}

/**
     Represents any text validator.
 */
public protocol TextInputValidatorType {
    
    func validate(_ text: String) -> ValidationResult
    
}
