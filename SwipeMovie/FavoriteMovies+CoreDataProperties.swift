//
//  FavoriteMovies+CoreDataProperties.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 20.12.2023.
//
//

import Foundation
import CoreData

extension FavoriteMovies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMovies> {
        return NSFetchRequest<FavoriteMovies>(entityName: "FavoriteMovies")
    }

    @NSManaged public var movieName: String?
    @NSManaged public var movieDescription: String?
    @NSManaged public var imdbRating: String?
    @NSManaged public var movieImage: Data?
}

extension FavoriteMovies: Identifiable {
}
