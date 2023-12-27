//
//  User.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 22.12.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var name: String = ""
    var historyItems: [String] = []
    
    init(id: String) {
        self.id = id
    }
}
