//
//  LoginViewConfiguration.swift
//  Authentication
//
//  Created by Daniela Riesgo on 3/31/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public protocol LoginViewConfigurationType {
    
    var logoImage: UIImage? { get }
    var colorPalette: ColorPaletteType { get }
    var fontPalette: FontPaletteType { get }
    
}

public final class DefaultLoginViewConfiguration: LoginViewConfigurationType {
    
    public let logoImage: UIImage?
    public let colorPalette: ColorPaletteType
    public let fontPalette: FontPaletteType
    
    public init() {
        logoImage = .None
        colorPalette = DefaultColorPalette()
        fontPalette = DefaultFontPalette()
    }
    
    public init(logoImage: UIImage?) {
        self.logoImage = logoImage
        colorPalette = DefaultColorPalette()
        fontPalette = DefaultFontPalette()
    }
    
}
