//
//  FilmListsLobbyTableView.swift
//  SwipeMovie
//
//  Created by Александр Бобрун on 26.11.2023.
//

import Foundation
import UIKit

final class FilmListsLobbyTableView: UITableView {
    
    // MARK: private types
    
    private enum ConstantsForTable {
        
        static let heightOfCellWithSpace: CGFloat = 52
    }
    
    // MARK: methods
    
    func makeTableView() {
        
        super.backgroundView?.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        super.backgroundColor = UIColor(named: "swipeMovieBlue")
        super.rowHeight = ConstantsForTable.heightOfCellWithSpace
        
        super.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
