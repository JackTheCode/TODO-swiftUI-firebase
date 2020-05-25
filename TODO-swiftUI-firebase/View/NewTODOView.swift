//
//  NewTODOView.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/20/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import SwiftUI

struct NewTODOView: View {
    
    @ObservedObject var newTODOViewModel = NewTODOViewModel()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var sessionManager: FirebaseSessionManager
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("TODO:")
                    TextField("Enter TODO", text: $newTODOViewModel.newTODO)
                    .padding()
                }
                Button(action: {
                    self.newTODOViewModel.addTODO(sessionManager: self.sessionManager) { isSuccess in
                        if isSuccess {
                            self.dismiss()
                        }
                    }
                }) {
                    Text("Add")
                }
            }
        }
        .padding()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
}
