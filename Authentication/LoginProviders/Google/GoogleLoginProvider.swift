//
//  GoogleLoginProvider.swift
//  Authentication
//
//  Created by Nahuel Gladstein on 6/28/17.
//  Copyright © 2017 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import GoogleSignIn
import enum Result.NoError

public struct GoogleLoginProviderUser: LoginProviderUser {
    public let userId: String
    public let idToken: String
    public let fullName: String
    public let givenName: String
    public let familyName: String
    public let email: Email?
    
    internal init(with user: GIDGoogleUser?) {
        userId = user?.userID ?? ""
        idToken = user?.authentication.idToken ?? ""
        fullName = user?.profile.name ?? ""
        givenName = user?.profile.givenName ?? ""
        familyName = user?.profile.familyName ?? ""
        email = Email(raw: user?.profile.email ?? "")
        
    }
    
}

public struct GoogleLoginProviderError: LoginProviderError {
    
    public let googleError: Error
    
    public var localizedMessage: String {
        return googleError.localizedDescription
    }
    
}

public final class GoogleLoginProvider: NSObject, LoginProvider {
    
    public static let name = "Google"
    
    public var configuration: GoogleLoginConfiguration = GoogleLoginConfiguration()
    public let userSignal: Signal<LoginProviderUserType, NoError>
    public let errorSignal: Signal<LoginProviderErrorType, NoError>
    
    fileprivate let userObserver: Observer<LoginProviderUserType, NoError>
    fileprivate let errorObserver: Observer<LoginProviderErrorType, NoError>
    
    public init(with clientId: String) {
        (userSignal, userObserver) = Signal.pipe()
        (errorSignal, errorObserver) = Signal.pipe()
        
        super.init()
        // Initialize sign-in
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().clientID = clientId //capaz en config
    }
    
    deinit {
        userObserver.sendCompleted()
        errorObserver.sendCompleted()
    }
    
    public func createButton() -> UIView {
        let button: GIDSignInButton = GIDSignInButton()
        button.style = .standard
        button.colorScheme = .light
        return button
    }
    
    public func logOut() -> SignalProducer<(), LoginProviderErrorType> {
        return SignalProducer { observer, _ in
            //LoginManager().logOut()
            observer.send(value: ())
            observer.sendCompleted()
        }
    }
    
    public var currentUser: LoginProviderUserType? {
        return .google(user: GoogleLoginProviderUser(with: .none))
    }
    
}

extension GoogleLoginProvider: GIDSignInDelegate {
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            self.userObserver.send(value: LoginProviderUserType.google(user: GoogleLoginProviderUser(with: user)))
        }
    }
    
}
