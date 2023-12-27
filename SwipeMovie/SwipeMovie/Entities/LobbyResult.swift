//
//  LobbyResult.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 26.12.2023.
//

import Foundation

struct LobbyResult: Identifiable, Codable {
    var id = UUID().uuidString
    var name = ""
    var film: String = ""
}
