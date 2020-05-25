//
//  NewTODOViewModel.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/20/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import SwiftUI

class NewTODOViewModel: ObservableObject {
    
    var newTODO = ""
    
    func addTODO(sessionManager: FirebaseSessionManager, completionHandler handler: @escaping (_ isSuccess: Bool) -> Void) {
        if !newTODO.isEmpty {
            sessionManager.uploadTODO(todo: newTODO)
            handler(true)
        } else {
            handler(false)
        }
    }
    
}
