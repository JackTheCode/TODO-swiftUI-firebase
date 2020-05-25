//
//  LoginViewModel.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/20/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    
    var email = ""
    var password = ""
        
    func login(sessionManager: FirebaseSessionManager) {
        sessionManager.login(email: email, password: password) { (result, error) in
            if error == nil {
                debugPrint("Login success")
            } else {
                debugPrint("Login error")
            }
        }
    }
    
}
