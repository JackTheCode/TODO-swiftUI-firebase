//
//  TODODetailViewModel.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/20/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import SwiftUI

class TODODetailViewModel: ObservableObject {
    
    @Published var complete = false
    
    func setupButton(todo: TODOS) {
        if todo.isComplete == "true" {
            complete = true
        } else {
            complete = false
        }
    }
    
    func buttonPressed(sessionManager: FirebaseSessionManager, todo: TODOS) {
        complete = !complete
        sessionManager.updateTODO(key: todo.key!, todo: todo.todo, isComplete: complete ? "true" : "false", completionHandler: { _ in })
    }
    
}
