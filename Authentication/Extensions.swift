//
//  Extensions.swift
//  Authentication
//
//  Created by Daniela Riesgo on 7/25/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

internal extension String {
    
    /**
         Returns a localized representation of the string,
         searching first in the main bundle or if it does
         not have the key in the framework one.
     */
    internal var frameworkLocalized: String {
        let localized: (_ from: Bundle) -> String = {
            NSLocalizedString(self, tableName: nil, bundle: $0, value: "", comment: "")
        }
        let mainLocalized = localized(Bundle.main)
        return mainLocalized == self ? localized(FrameworkBundle) : mainLocalized
    }
    
    /**
         Returns a localized representation of the string,
         searching first in the main bundle or if it does
         not have the key in the framework one.
     
         - parameter arguments: Formatting arguments.
     */
    internal func frameworkLocalized(withArguments arguments: CVarArg...) -> String {
        return String(format: frameworkLocalized, arguments: arguments)
    }
    
}
