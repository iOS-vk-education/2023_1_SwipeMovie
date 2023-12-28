//
//  UserManager.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 22.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager {
    
    // MARK: properties
    
    static let shared = UserManager()
    
    var user: User
    
    var userAndName: [String: String] = [:]
    
    // MARK: private properties
    
    private let dataBase = Firestore.firestore()
    
    private init() {
        let auth = Auth.auth()
        
        auth.signInAnonymously { _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("Successfully signed in")
        }
        
        user = User(id: auth.currentUser?.uid ?? UUID().uuidString)
        getUser(id: user.id)
//        sendUser()
    }
    
    func getUser(id: String) {

        dataBase.collection("user").document(id).addSnapshotListener { (querySnapshot, error) in
            guard let document = querySnapshot, document.exists else {
                print("Error fetching User: \(String(describing: error)) or User doesn't exist")
                return
            }
            let dataDescription = document.data()
            self.user.name = dataDescription?["name"] as? String ?? ""
            self.user.historyItems = dataDescription?["historyItems"] as? [String] ?? []
            for lobbyResultId in self.user.historyItems {
                LobbyResultManager.shared.getLobbyResult(lobbyResultId: lobbyResultId)
            }
            print("i updated user")
        }
    }
    
    func sendUserOnce(completion: () -> Void) {
        do {
            try dataBase.collection("user").document(user.id).setData(from: user)
        } catch {
            print("Error adding messages to Firestore: \(error.localizedDescription)")
        }
        completion()
    }
    
    func getUserOnce(completion: @escaping () -> Void) {

        dataBase.collection("user").document(self.user.id).getDocument { (querySnapshot, error) in
            guard let document = querySnapshot, document.exists else {
                print("Error fetching User: \(String(describing: error)) or User doesn't exist")
                return
            }
            let dataDescription = document.data()
            self.user.historyItems = dataDescription?["historyItems"] as? [String] ?? []
            for lobbyResultId in self.user.historyItems {
                LobbyResultManager.shared.getLobbyResult(lobbyResultId: lobbyResultId)
            }
            completion()
        }
    }
    
    func getUserName(id: String) {

        let documentReference = dataBase.collection("user").document(id)
        documentReference.getDocument { (document, error) in
            guard let document = document, document.exists else {
                print("Error fetching User: \(String(describing: error)) or User doesn't exist")
                return
            }
            let dataDescription = document.data()
            self.userAndName[id] = dataDescription?["name"] as? String ?? ""
        }
    }
    
    func sendUser() {
        do {
            try dataBase.collection("user").document(user.id).setData(from: user)
        } catch {
            print("Error adding messages to Firestore: \(error.localizedDescription)")
        }
    }
    
    func addHistoryItem(lobbyResultId: String) {
        user.historyItems.append(lobbyResultId)
    }

}
