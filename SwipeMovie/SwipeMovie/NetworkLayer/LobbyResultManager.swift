//
//  LobbyResultManager.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 26.12.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class LobbyResultManager {
    
    // MARK: properties
    
    static let shared = LobbyResultManager()
    
    var lobbyResult = LobbyResult()
    
    var resultsDictionary: [String: (String, Film)] = [:]
    
    // new feature for searchBar
    
    var lobbyData: [(String, Film)] = []
    
    // MARK: private properties
    
    private let dataBase = Firestore.firestore()
    
    // MARK: methods
    
    private init() {
        
    }
    
    func getLobbyResult(lobbyResultId: String) {
    
        dataBase.collection("lobbyResults").document(lobbyResultId).getDocument { (querySnapshot, error) in
            guard let document = querySnapshot else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }

            let dataDescription = document.data()
            // fetching lobbyResults
            FilmManager.shared.getFilm(id: dataDescription?["film"] as? String ?? "") {
                let film = FilmManager.shared.filmsDictionary[dataDescription?["film"] as? String ?? ""] ?? Film()
                let name = dataDescription?["name"] as? String ?? ""
                self.resultsDictionary[lobbyResultId] = (name, film)
                
                // add elements for easy setUp searchBar logic
                self.lobbyData.append((name, film))
            }
        }
    }
    
    func sendLobbyResult(nameOfLobby: String, filmId: String, id: String) {
        
        dataBase.collection("lobbyResults").document(id).setData(["name": nameOfLobby,
                                                                  "id": id,
                                                                  "film": filmId]) { error in
            if let error = error {
                print("Failed to upload try with error: \(error.localizedDescription)")
                return
            }
        }
        
    }
}
