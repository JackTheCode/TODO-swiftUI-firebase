//
//  TODODetailView.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/20/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import SwiftUI

struct TODODetailView: View {
    
    @ObservedObject var todoDetailViewModel = TODODetailViewModel()
    @EnvironmentObject var sessionManager: FirebaseSessionManager
    var todo: TODOS
        
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Text(todo.todo)
            Spacer()
            VStack {
                Text("Is Complete")
                Button(action: {
                    self.todoDetailViewModel.buttonPressed(sessionManager: self.sessionManager, todo: self.todo)
                }) {
                    if todoDetailViewModel.complete {
                        Image(systemName: "checkmark").imageScale(.medium)
                    } else {
                        Image(systemName: "xmark").imageScale(.medium)
                    }
                }
                .onAppear {
                    self.todoDetailViewModel.setupButton(todo: self.todo)
                }
            }
        }
        .padding()
    }
    
    
}
