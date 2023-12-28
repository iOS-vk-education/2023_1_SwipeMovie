//
//  LobbyManager.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 23.12.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class LobbyManager {

    // MARK: properties
    
    static var shared = LobbyManager()
    
    var lobby = Lobby()
    
    var filmsInLobby: [Film] = []
    
    var likedFilmsArray: [String] = []
    
    var isHost = false
    
    // MARK: private properties
    
    private let dataBase = Firestore.firestore()
    
    // MARK: methods
    
    private init() {
        
    }
    
    func resetAll() {
        LobbyManager.shared = LobbyManager()
    }
    
    func iAmHosting() {
        isHost.toggle()
    }
    
    func isExists(code: String, completionFalse: @escaping () -> Void, completionTrue: @escaping () -> Void) {
        let docRef = dataBase.collection("lobby").document(code)
        docRef.getDocument { (documentSnapshot, error)  in
            if let documentSnapshot = documentSnapshot{
                if !documentSnapshot.exists {
                    completionFalse()
                } else {
                    completionTrue()
                }
            } else {
                completionFalse()
            }
        }
    }
    
    func deleteLobby(code: String) {
        dataBase.collection("lobby").document(code).delete()
    }
    
    func getLobby(code: String, completion: @escaping () -> Void) {

        dataBase.collection("lobby").document(code).addSnapshotListener { (querySnapshot, error) in
            guard let document = querySnapshot else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            let dataDescription = document.data()
            // fetching flags
            self.lobby.abortFlag = dataDescription?["abortFlag"] as? Bool ?? false
            self.lobby.finalFlag = dataDescription?["finalFlag"] as? Bool ?? false
            self.lobby.startFlag = dataDescription?["startFlag"] as? Bool ?? false
            
            // fetching name and code
            self.lobby.name = dataDescription?["name"] as? String ?? "NoName"
            self.lobby.code = code
            
            // fetching guests
            let dict = dataDescription?["guests"] as? [String: Bool]
            if let dict = dict {
                self.lobby.guests = [:]
                for (id, isReady) in dict {
                    self.lobby.guests[id] = isReady
                    UserManager.shared.getUserName(id: id)
                }
            }
        
            // fetching filmsLists
            let arrForLists = dataDescription?["filmsList"] as? [String]
            if let arrForLists = arrForLists {
                self.lobby.filmLists = arrForLists
                FilmsListManager.shared.filmsListDictionary = [:]
                for id in arrForLists {
                    FilmsListManager.shared.getFilmsListNames(id: id)
                }
            }
            
            // fetching likedFilms
            let arrForFilms = dataDescription?["likedFilms"] as? [String]
            if let arrForFilms = arrForFilms {
                self.lobby.likedFilms = arrForFilms
            }
            
            self.lobby.finalFilm = dataDescription?["finalFilm"] as? String ?? ""
            completion()
        }
    }
    
    func createLobby() {
        
        dataBase.collection("lobby").document(lobby.code).setData(["name": lobby.name,
                                                                   "id": lobby.id,
                                                                   "guests": [UserManager.shared.user.id: true],
                                                                   "startFlag": false,
                                                                   "abortFlag": false,
                                                                   "finalFlag": false]) { error in
            if let error = error {
                print("Failed to upload try with error: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func addUserToLobby() {
        
        updateDB(field: "guests", value: lobby.guests)
    }
    
    func addFilmListToLobby(filmListId: String) {
        
        lobby.filmLists.append(filmListId)
        updateDB(field: "filmsList", value: lobby.filmLists)
    }
        
    func deleteFilmListFromLobby(filmListId: String) {
            
        lobby.filmLists = lobby.filmLists.filter { $0 != filmListId }
        FilmsListManager.shared.filmsListDictionary[filmListId] = nil
        updateDB(field: "filmsList", value: lobby.filmLists)
    }
    
    func getAllFilmOfLobby(complition: @escaping () -> Void){
        
        for (id, _) in FilmsListManager.shared.filmsListDictionary {
            if let arr = FilmsListManager.shared.filmsListDictionary[id]?.films {
                for filmId in arr {
                    filmsInLobby.append(FilmManager.shared.filmsDictionary[filmId] ?? Film())
                }
            }
        }
        if isHost {
            let filmId = filmsInLobby.map { $0.id }
            updateDB(field: "likedFilms", value: Array(Set(filmId)))
        }
        complition()
    }
    
    func startLobby() {
        
        getAllFilmOfLobby(){}
        updateDB(field: "startFlag", value: true)
        
        for id in lobby.guests.keys {
            lobby.guests[id] = false
        }
        updateDB(field: "guests", value: lobby.guests)
    }
    
    func userIsReady() {
        
        lobby.guests[UserManager.shared.user.id] = true
        updateDB(field: "guests", value: lobby.guests)
        
        // the final flag turn on
        if self.lobby.startFlag {
            var allAreReadyFlag = true
            for id in self.lobby.guests.keys {
                if self.lobby.guests[id] ?? false {
                    allAreReadyFlag.toggle()
                }
            }
            if allAreReadyFlag {
                updateDB(field: "finalFlag", value: true)
            }
        }
    }
    
    func likeFilm(filmId: String) {
        likedFilmsArray.append(filmId)
    }
    
    func sendLikedFilms() {
        
        print("before \(lobby.likedFilms)")
        lobby.likedFilms.append(contentsOf: likedFilmsArray)
        print("after \(lobby.likedFilms)")
        updateDB(field: "likedFilms", value: lobby.likedFilms)
    }
    
    func getFinalFilm() {
        
        print(lobby.likedFilms)
        var counts = [String: Int]()

        // Count the values with using forEach
        lobby.likedFilms.forEach { counts[$0] = (counts[$0] ?? 0) + 1 }

        // Find the most frequent value and its count with max(by:)
        if let (value, _) = counts.max(by: {$0.1 < $1.1}) {
            lobby.finalFilm = value
            updateDB(field: "finalFlag", value: true)
            updateDB(field: "finalFilm", value: lobby.finalFilm)
            let id = UUID().uuidString
            LobbyResultManager.shared.sendLobbyResult(nameOfLobby: lobby.name, filmId: lobby.finalFilm, id: id)
            updateDB(field: "likedFilms", value: id)
        }
    }
    
    func addFilmToHistory() {
        
        dataBase.collection("lobby").document(lobby.code).getDocument { (querySnapshot, error) in
            guard let document = querySnapshot else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }

            let dataDescription = document.data()
            print(dataDescription)
            self.lobby.likedFilms = [dataDescription?["likedFilms"]] as? [String] ?? []
            print(self.lobby.likedFilms)
        }
    }
    
    // MARK: private methods
    
    private func updateDB(field: String, value: Any) {
        
        dataBase.collection("lobby").document(lobby.code).updateData([field: value]) { error in
            if let error = error {
                print("Failed to upload try with error: \(error.localizedDescription)")
                return
            }
        }
    }
}
