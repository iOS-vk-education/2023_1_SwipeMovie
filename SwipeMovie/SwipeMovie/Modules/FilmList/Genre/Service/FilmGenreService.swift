//
//  FilmGenreService.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 26.11.2023.
//

import Foundation

enum FilmGenreError: Error {
    case badUrl
    case failedStatus
    case failedParsing
}

protocol FileGenresService {
    func loadGenres(completion: @escaping (Result<[FilmGenreResponse], Error>) -> ())
}

final class FileGenresServiceImpl: FileGenresService {
    func loadGenres(completion: @escaping (Result<[FilmGenreResponse], Error>) -> ()) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ApiConstants.host
        components.path = "/v1/movie/possible-values-by-field"
        
        components.queryItems = [
            URLQueryItem(name: "field", value: "genres.name")
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
                let response = try JSONDecoder().decode([FilmGenreResponse].self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(FilmGenreError.failedParsing))
            }
            
            
        }
        task.resume()
    }
}
