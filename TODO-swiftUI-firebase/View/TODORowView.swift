//
//  TODORowView.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/20/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import SwiftUI

struct TODORowView: View {
    
    var todo: TODOS
    
    var body: some View {
        HStack {
            Text(todo.todo)
            Spacer()
            if todo.isComplete == "true" {
                Image(systemName: "checkmark").imageScale(.medium)
            } else {
                Image(systemName: "xmark").imageScale(.medium)
            }
        }
    }
    
}
