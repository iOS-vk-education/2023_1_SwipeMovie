//
//  HistoryData+CoreDataProperties.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 16.12.2023.
//
//

import Foundation
import CoreData

extension HistoryData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HistoryData> {
        return NSFetchRequest<HistoryData>(entityName: "HistoryData")
    }

    @NSManaged public var lobbyName: String?
    @NSManaged public var movieName: String?
    @NSManaged public var movieDescription: String?
    @NSManaged public var movieImage: Data?

}

extension HistoryData: Identifiable {
}
