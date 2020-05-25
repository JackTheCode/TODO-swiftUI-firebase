//
//  User.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/19/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation

final class User: Identifiable {
    let uid: String?
    let email: String?
    let displayName: String?
    
    init(uid: String, email: String, displayName: String) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
        
}
