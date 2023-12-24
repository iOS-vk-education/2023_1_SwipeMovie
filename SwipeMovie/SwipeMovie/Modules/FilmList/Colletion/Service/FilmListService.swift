//
//  FilmListService.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 26.11.2023.
//

import Foundation

enum FilmListError: Error {
    case badUrl
    case failedStatus
    case failedParsing
}

protocol FilmListService {
    func loadFilms(
        genre: String,
        completion: @escaping (Result<FilmsResponse, Error>) -> ()
    )
}

final class FilmListServiceImpl: FilmListService {
    func loadFilms(
        genre: String,
        completion: @escaping (Result<FilmsResponse, Error>) -> ()
    ) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ApiConstants.host
        components.path = "/v1.4/movie"
        
        components.queryItems = [
            URLQueryItem(name: "limit", value: "30"),
            URLQueryItem(name: "genres.name", value: genre)
        ]
        
        guard let url = components.url else { return completion(.failure(FilmGenreError.badUrl)) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(ApiConstants.token, forHTTPHeaderField: "X-API-KEY")
        request.timeoutInterval = 120
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error {
                return completion(.failure(error))
            }
            guard
                let data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else {
                return completion(.failure(FilmGenreError.failedStatus))
            }
            
            do {
                let response = try JSONDecoder().decode(FilmsResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(FilmGenreError.failedParsing))
            }
            
        }
        task.resume()
    }
}
