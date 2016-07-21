//
//  ConstantValidators.swift
//  Authentication
//
//  Created by Daniela Riesgo on 7/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

/*
     Represents a validator which will consider
     any input valid.
 */
public struct AlwaysValidValidator: TextInputValidatorType {
    
    public func validate(text: String) -> ValidationResult {
        return .Valid
    }
    
}

/*
     Represents a validator which will consider
     any input invalid.
     It provides an errorTextToLocalize property
     to customize the error message associated
     with the invalidity, to explain its reason.
 */
public struct AlwaysInvalidValidator: TextInputValidatorType {
    
    public var errorTextToLocalize: String = ""
    
    public func validate(text: String) -> ValidationResult {
        return .Invalid(errors: [errorTextToLocalize.localized(text)])
    }
    
}
