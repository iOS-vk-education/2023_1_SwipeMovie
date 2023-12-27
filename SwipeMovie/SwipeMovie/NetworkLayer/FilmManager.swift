//
//  FilmManager.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 23.12.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FilmManager {
    
    // MARK: properties
    
    static let shared = FilmManager()
    
    var filmsDictionary: [String: Film] = [:]
    
    var allFilms: [String: [Film]] = [:]
    
    // MARK: private properties
    
    private let dataBase = Firestore.firestore()
    
    // MARK: private method
    
    private init() {
        
    }
    
    // MARK: methods
    
    func getFilm(id: String) {

        let documentReference = dataBase.collection("film").document(id)
        documentReference.getDocument { (document, error) in
            guard let document = document, document.exists else {
                print("Error fetching film: \(String(describing: error)) or film doesn't exist")
                return
            }
            let dataDescription = document.data()
            var film = Film()
            film.id = id
            film.name = dataDescription?["name"] as? String ??  ""
            film.description = dataDescription?["description"] as? String ?? ""
            film.imageURL = dataDescription?["image"] as? String ?? ""
            self.filmsDictionary[id] = film
        }
    }
    
    func getFilm(id: String, complition: @escaping () -> Void) {

        let documentReference = dataBase.collection("film").document(id)
        documentReference.getDocument { (document, error) in
            guard let document = document, document.exists else {
                print("Error fetching film: \(String(describing: error)) or film doesn't exist")
                return
            }
            let dataDescription = document.data()
            var film = Film()
            film.id = id
            film.name = dataDescription?["name"] as? String ??  ""
            film.description = dataDescription?["description"] as? String ?? ""
            film.imageURL = dataDescription?["image"] as? String ?? ""
            self.filmsDictionary[id] = film
            complition()
        }
    }
    
    func getFilmFromList(filmListid: String, filmId: String) {
        
        let documentReference = dataBase.collection("film").document(filmId)
        documentReference.getDocument { (document, error) in
            guard let document = document, document.exists else {
                print("Error fetching film: \(String(describing: error)) or film doesn't exist")
                return
            }
            let dataDescription = document.data()
            var film = Film()
            film.id = filmId
            film.name = dataDescription?["name"] as? String ??  ""
            film.description = dataDescription?["description"] as? String ?? ""
            film.imageURL = dataDescription?["image"] as? String ?? ""
            self.allFilms[filmListid]?.append(film)
            print(self.allFilms)
        }
    }
}
