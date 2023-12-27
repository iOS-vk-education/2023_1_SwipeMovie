//
//  Film.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 22.12.2023.
//

import Foundation

struct Film: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    var name = ""
    var description = ""
    var imageURL = ""
}
