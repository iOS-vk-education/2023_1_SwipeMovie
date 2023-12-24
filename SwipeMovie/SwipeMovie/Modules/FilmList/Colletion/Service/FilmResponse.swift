//
//  FilmResponse.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 26.11.2023.
//

import Foundation

struct FilmResponse: Decodable {
    struct Poster: Decodable {
        let url: URL
        let previewUrl: URL
    }

    let id: Int
    let name: String
    let description: String
    let poster: Poster
}

struct FilmsResponse: Decodable {
    let docs: [FilmResponse]
}
