//
//  LoginControllerTransitionDelegate.swift
//  Authentication
//
//  Created by Daniela Riesgo on 7/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//


/**
     Protocol for handling transition events occured during login.
 */
public protocol LoginControllerTransitionDelegate {
    
    /**
         Function that reacts to the user logging in
         succesfully.
         
         Should take care of the screen transition.
     */
    func onLoginSuccess(controller: LoginController)
    
    /**
         Function that reacts to the user pressing "Sign Up"
         in the login screen.
         
         Should take care of the screen transition.
     */
    func toSignup(controller: LoginController)
    
    
    /**
         Function that reacts to the user pressing "Recover 
         Password" in the login screen.
         
         Should take care of the screen transition.
     */
    func toRecoverPassword(controller: LoginController)
    
}
