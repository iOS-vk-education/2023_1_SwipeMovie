//
//  FilmsList.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 22.12.2023.
//

import Foundation

struct FilmsList: Identifiable, Codable {
    var id = UUID().uuidString
    var name = ""
    var description = ""
    var films: [String] = []
}
