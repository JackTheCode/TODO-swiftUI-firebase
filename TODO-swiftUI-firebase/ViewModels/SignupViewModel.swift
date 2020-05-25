//
//  SignupViewModel.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/20/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    
    var email = ""
    var password = ""
    
    func signup(sessionManager: FirebaseSessionManager) {
        if !email.isEmpty && !password.isEmpty {
            sessionManager.signup(email: email, password: password) { (result, error) in
                if error == nil {
                    debugPrint("Signup success")
                } else {
                    debugPrint("Signup error")
                }
            }
        }
    }
}
