//
//  ColorPalette.swift
//  Authentication
//
//  Created by Daniela Riesgo on 3/31/16.
//  Copyright © 2016 Wolox. All rights reserved.
//


/*
     Represents the color hierarchy necessary for
     an authentication view.
 */
public protocol ColorPaletteType {
    
    var background: UIColor { get }
    
    var mainButtonDisabled: UIColor { get }
    var mainButtonEnabled: UIColor { get }
    var mainButtonExecuted: UIColor { get }
    
    var textfieldsError: UIColor { get }
    var textfieldsNormal: UIColor { get }
    var textfieldsSelected: UIColor { get }
    
    // Links refers to any navigational button or
    // link present in the view.
    var links: UIColor { get }
    var labels: UIColor { get }
    var textfieldText: UIColor { get }
    var passwordVisibilityButtonText: UIColor { get }
    var mainButtonText: UIColor { get }
    
}

public extension ColorPaletteType {
    
    public var mainButtonDisabled: UIColor { return UIColor(hexString: "#d8d8d8ff")! }
    public var mainButtonEnabled: UIColor { return UIColor(hexString: "#f5a623ff")! }
    public var mainButtonExecuted: UIColor { return UIColor(hexString: "#e78f00ff")! }
    
    public var textfieldsError: UIColor { return UIColor(hexString: "#d0021bff")! }
    public var textfieldsNormal: UIColor { return .clearColor() }
    public var textfieldsSelected: UIColor { return .clearColor() }
    
    public var background: UIColor { return UIColor(hexString: "#efefefff")! }
    
    public var links: UIColor { return UIColor(hexString: "#0076ffff")! }
    public var labels: UIColor { return .blackColor() }
    public var textfieldText: UIColor { return .blackColor() }
    public var passwordVisibilityButtonText: UIColor { return UIColor(hexString: "#0076ffff")! }
    public var mainButtonText: UIColor { return .whiteColor() }
    
}

public struct DefaultColorPalette: ColorPaletteType { }
