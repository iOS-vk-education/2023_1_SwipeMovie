//
//  HistoryData+CoreDataProperties.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 20.12.2023.
//
//

import Foundation
import CoreData

extension HistoryData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HistoryData> {
        return NSFetchRequest<HistoryData>(entityName: "HistoryData")
    }

    @NSManaged public var lobbyName: String?
    @NSManaged public var movieDescription: String?
    @NSManaged public var movieImage: Data?
    @NSManaged public var movieName: String?
    @NSManaged public var imdbRating: String?

}

extension HistoryData: Identifiable {

}
