//
//  FirebaseSession.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/19/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import Firebase

class FirebaseSessionManager: ObservableObject {
    @Published var session: User?
    @Published var isLoggedIn: Bool?
    @Published var items: [TODOS] = []
    
    var ref = Database.database().reference(withPath: "\(Auth.auth().currentUser?.uid ?? "Error")")
    
    func listen() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, email: user.email ?? "", displayName: user.displayName ?? "")
                self.isLoggedIn = true
                self.getTODOS()
            }
        }
    }
    
    func login(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
        self.isLoggedIn = false
        self.session = nil
    }
    
    func signup(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func getTODOS() {
        ref.observe(DataEventType.value) { snapshot in
            self.items = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let todo = TODOS(snapShot: snapshot) {
                    self.items.append(todo)
                }
            }
        }
    }
    
    func uploadTODO(todo: String) {
        let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
        let postRef = ref.child(String(number))
        let post = TODOS(todo: todo, isComplete: "false")
        postRef.setValue(post.toAnyObject())
    }
    
    func updateTODO(key: String, todo: String, isComplete: String, completionHandler handler: @escaping(_ isSuccess: Bool) -> Void) {
        let update = ["todo": todo, "isComplete": isComplete]
        let childUpdate = ["\(key)": update]
        ref.updateChildValues(childUpdate, withCompletionBlock: { error, _ in
            if error == nil {
                handler(true)
            } else {
                handler(false)
            }
        })
    }
    
    func removeTODO(todo: TODOS, completionHandler handler: @escaping(_ isSuccess: Bool) -> Void) {
        ref.child(todo.key!).removeValue { (error, _) in
            if error == nil {
                handler(true)
                debugPrint("Delete success")
            } else {
                handler(false)
                debugPrint("Delete fail")
            }
        }
    }
    
}
