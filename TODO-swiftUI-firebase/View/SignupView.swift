//
//  SignupView.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/20/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import SwiftUI

struct SignupView: View {
    
    @ObservedObject var signupViewModel = SignupViewModel()
    @EnvironmentObject var sessionManager: FirebaseSessionManager
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("Email")
                    TextField("Enter email address", text: $signupViewModel.email)
                }
                .padding()
                HStack {
                    Text("Password")
                    TextField("Enter passowrd", text: $signupViewModel.password)
                }
                .padding()
                Button(action: {
                    self.signupViewModel.signup(sessionManager: self.sessionManager)
                }) {
                    Text("Sign up")
                }
            }
            .padding()
        }
    }
    
}
