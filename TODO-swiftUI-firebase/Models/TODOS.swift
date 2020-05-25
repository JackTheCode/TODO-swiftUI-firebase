//
//  TODOS.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/19/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import Firebase

struct TODOS: Identifiable {
    
    let ref: DatabaseReference?
    let key: String?
    let todo: String
    let isComplete: String
    let id: String
    
    init(todo: String, isComplete: String, key: String = "") {
        self.ref = nil
        self.key = key
        self.todo = todo
        self.isComplete = isComplete
        self.id = key
    }
    
    init?(snapShot: DataSnapshot) {
        guard let value = snapShot.value as? [String: AnyObject],
              let todo = value["todo"] as? String,
              let isComplete = value["isComplete"] as? String
            else {
                return nil
        }
        self.ref = snapShot.ref
        self.key = snapShot.key
        self.todo = todo
        self.isComplete = isComplete
        self.id = snapShot.key
    }
    
    func toAnyObject() -> Any {
        return [
            "todo": todo,
            "isComplete": isComplete
        ]
    }
    
}
