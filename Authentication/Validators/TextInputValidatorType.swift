//
//  TextInputValidatorType.swift
//  Authentication
//
//  Created by Daniela Riesgo on 3/16/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

/*
     Represents any possible validation result:
     valid, or invalid with any possibe quantity of errors.
 */
public enum ValidationResult {
    
    public static func invalid(errorMessage: String) -> ValidationResult {
        return .Invalid(errors: [errorMessage])
    }
    
    public static var valid: ValidationResult {
        return .Valid
    }
    
    case Valid
    case Invalid(errors: [String])
    
    var isValid: Bool {
        switch self {
        case .Valid: return true
        case .Invalid(_): return false
        }
    }
    
    var errors: [String] {
        switch self {
        case .Valid: return []
        case .Invalid(let _errors): return _errors
        }
    }
    
}

/*
     Represents any text validator.
 */
public protocol TextInputValidatorType {
    
    func validate(text: String) -> ValidationResult
    
}
