//
//  LoginView.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/20/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    @EnvironmentObject var sessionManager: FirebaseSessionManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign in")
            TextField("Email", text: $loginViewModel.email)
            SecureField("Password", text: $loginViewModel.password)
            Button(action: {
                self.loginViewModel.login(sessionManager: self.sessionManager)
            }) {
                Text("Sign in")
            }
            .padding()
            NavigationLink(destination: SignupView()) {
                Text("Sign up")
            }
        }
        
    }
}
