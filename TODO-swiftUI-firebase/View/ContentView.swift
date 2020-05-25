//
//  ContentView.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/19/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @EnvironmentObject var sessionManager: FirebaseSessionManager
        
    var body: some View {
        NavigationView {
            Group {
                if sessionManager.session != nil {
                    VStack {
                        NavigationLink(destination: NewTODOView()) {
                            Text("Add TODO")
                        }
                        List {
                            ForEach(sessionManager.items) { todo in
                                NavigationLink(destination: TODODetailView(todo: todo)) {
                                    TODORowView(todo: todo)
                                }
                            }
                            .onDelete { indexSet in
                                guard let todos = NSArray(array: self.sessionManager.items).objects(at: indexSet) as? [TODOS] else {
                                    return
                                }
                                self.sessionManager.removeTODO(todo: todos.first!) { isSuccess in
                                    if isSuccess {
                                        self.sessionManager.items.remove(atOffsets: indexSet)
                                    }
                                }
                            }
                        }
                        .navigationBarItems(trailing: Button(action: {
                            self.sessionManager.logout()
                        }) {
                            Text("Logout")
                        })
                    }
                } else {
                    LoginView()
                    .navigationBarItems(trailing: Text(""))
                }
            }
            .onAppear(perform: sessionManager.listen)
            .navigationBarTitle(Text("TODO"))
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
