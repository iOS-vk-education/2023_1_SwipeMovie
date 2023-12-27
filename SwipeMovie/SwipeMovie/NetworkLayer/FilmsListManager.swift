//
//  FilmsListManager.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 23.12.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FilmsListManager {
    
    // MARK: properties
    
    static let shared = FilmsListManager()
    
    var filmsList = FilmsList()
    
    var filmsListDictionary: [String: FilmsList] = [:]
    
    var allFilmsListDictionary: [String: FilmsList] = [:]
    
    // MARK: private properties
    
    private let dataBase = Firestore.firestore()
    
    private init() {
        
    }
    
    func getAllFilmListsAndFilms() {
        print("fuck")
        let documentReference = dataBase.collection("filmsList")
        documentReference.getDocuments() { (documents, error) in
            guard let documents = documents else {
                print("Error fetching documents: \(String(describing: error)) or documents doesn't exist")
                return
            }
            documents.documents.forEach { (document) in
                let dataDescription = document.data()
                var filmsList = FilmsList()
                filmsList.id = dataDescription["id"] as? String ?? ""
                filmsList.name = dataDescription["name"] as? String ?? ""
                filmsList.description = dataDescription["description"] as? String ?? ""
                filmsList.films = dataDescription["films"] as? [String] ?? []
                FilmManager.shared.allFilms[filmsList.id] = []
                for filmId in filmsList.films {
                    FilmManager.shared.getFilmFromList(filmListid: filmsList.id, filmId: filmId)
                }
                print(filmsList)
                self.allFilmsListDictionary[filmsList.id] = filmsList
            }
        }
    }
    
        
//        dataBase.collection("filmsList").getDocuments { (snapshot, error) in
//                    snapshot?.documents.forEach({ (document) in
//                        let dictionary = document.data()
//                        let user = TFUser(dictionary: dictionary)
//                        users.append(user)
//    }
    
    func getFilmsList(id: String) {

        let documentReference = dataBase.collection("filmsList").document(id)
        documentReference.getDocument { (document, error) in
            guard let document = document, document.exists else {
                print("Error fetching User: \(String(describing: error)) or User doesn't exist")
                return
            }
            let dataDescription = document.data()
            self.filmsList.name = dataDescription?["name"] as? String ?? ""
            self.filmsList.description = dataDescription?["description"] as? String ?? ""
            self.filmsList.films = dataDescription?["films"] as? [String] ?? []
        }
    }
    
    func getFilmsListNames(id: String) {
        
        let documentReference = dataBase.collection("filmsList").document(id)
        documentReference.getDocument { (document, error) in
            guard let document = document, document.exists else {
                print("Error fetching User: \(String(describing: error)) or FilmsList doesn't exist")
                return
            }
            let dataDescription = document.data()
            var filmsList = FilmsList()
            filmsList.id = id
            filmsList.name = dataDescription?["name"] as? String ?? ""
            filmsList.description = dataDescription?["description"] as? String ?? ""
            filmsList.films = dataDescription?["films"] as? [String] ?? []
            for filmId in filmsList.films {
                FilmManager.shared.getFilm(id: filmId)
            }
            self.filmsListDictionary[id] = filmsList
        }
    }
}
