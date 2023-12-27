//
//  Lobby.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 22.12.2023.
//

import Foundation

struct Lobby: Identifiable, Codable {
    var id = UUID().uuidString
    var name = ""
    var code = "000000"
    var guests: [String: Bool] = [:]
    var filmLists: [String] = []
    var likedFilms: [String] = []
    var finalFilm = ""
    var startFlag: Bool = false
    var abortFlag: Bool = false
    var finalFlag: Bool = false
    
    mutating func firstLobbySetUp(name: String, code: String) {
        self.name = name
        self.code = code
    }
}
