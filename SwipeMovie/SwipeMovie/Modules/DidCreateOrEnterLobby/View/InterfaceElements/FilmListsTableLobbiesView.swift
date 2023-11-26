//
//  FilmListsTableLobbiesView.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 25.11.2023.
//

import Foundation
import UIKit

final class FilmListsTableLobbiesView: UIView {
    
    // MARK: private types
    
    private enum ConstantsForTable {
        
        static let titleFontSize: CGFloat = 22
        static let buttonFontSize: CGFloat = 17
        static let heightOfCellWithSpace: CGFloat = 52
        static let spaceBetweenTableAndLable: CGFloat = 16
        static let marginFromBottom: CGFloat = 140
    }
    
    // MARK: properties
    
    var filmListTableView = UITableView()
    var tableLabel = CustomUILabel()
    
    // MARK: methods
    
    func makeTableView() {
        
        filmListTableView.backgroundView?.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        tableLabel.makeSubtitleLabel(text: "Списки фильмов")
        tableLabel.font = UIFont.systemFont(ofSize: tableLabel.font.pointSize,
                                            weight: .medium)
        super.addSubview(tableLabel)
        
        filmListTableView.backgroundColor = UIColor(named: "swipeMovieBlue")
        filmListTableView.rowHeight = ConstantsForTable.heightOfCellWithSpace
        super.addSubview(filmListTableView)
        
        filmListTableView.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        super.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            super.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            super.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            tableLabel.leadingAnchor.constraint(equalTo: super.leadingAnchor,
                                                constant: ConstantsMain.marginFromSides),

            filmListTableView.bottomAnchor.constraint(equalTo: super.bottomAnchor,
                                                      constant: -ConstantsForTable.marginFromBottom),
            filmListTableView.topAnchor.constraint(equalTo: tableLabel.bottomAnchor,
                                                   constant: ConstantsForTable.spaceBetweenTableAndLable),
            filmListTableView.centerXAnchor.constraint(equalTo: super.centerXAnchor),
            filmListTableView.leadingAnchor.constraint(equalTo: super.leadingAnchor),
            filmListTableView.heightAnchor.constraint(equalToConstant: 3.0 / 5.0 * UIScreen.main.bounds.height -
                                                      ConstantsForTable.marginFromBottom)
        ])
    }
    
}
