//
//  SignupViewConfiguration.swift
//  Authentication
//
//  Created by Daniela Riesgo on 4/1/16.
//  Copyright © 2016 Wolox. All rights reserved.
//


/*
     Represents the configurations able to
     be customized to a SignupViewType.
     Includes the font and color palettes,
     and the decision to include or exclude
     optional textfields.
 */
public protocol SignupViewConfigurationType {
    
    var colorPalette: ColorPaletteType { get }
    var fontPalette: FontPaletteType { get }
    
    /// NSURL from where to get the HTML content that displays the terms and services.
    var termsAndServicesURL: NSURL { get }
    
    // Textfield selected must be consistent with the view used.
    var usernameEnabled: Bool { get }
    var passwordConfirmationEnabled: Bool { get }
    
}

/*
    The SignupViewConfiguration stores all palettes
    and decisions necessary.
    By default, it uses the default palettes and
    doesn't include optional textfields.
 */
public struct SignupViewConfiguration: SignupViewConfigurationType {
    
    public let colorPalette: ColorPaletteType
    public let fontPalette: FontPaletteType
    public let termsAndServicesURL: NSURL
    public let usernameEnabled: Bool
    public let passwordConfirmationEnabled: Bool
    
    public init(colorPalette: ColorPaletteType = DefaultColorPalette(),
                fontPalette: FontPaletteType = DefaultFontPalette(),
                usernameEnabled: Bool = false,
                passwordConfirmationEnabled: Bool = false,
                termsAndServicesURL: NSURL) {
        self.colorPalette = colorPalette
        self.fontPalette = fontPalette
        self.termsAndServicesURL = termsAndServicesURL
        self.usernameEnabled = usernameEnabled
        self.passwordConfirmationEnabled = passwordConfirmationEnabled
    }
    
}
