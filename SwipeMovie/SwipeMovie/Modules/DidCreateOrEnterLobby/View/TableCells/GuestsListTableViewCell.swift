//
//  GuestsListTableViewCell.swift
//  SwipeMovie
//
//  Created by Alexander on 05.12.2023.
//

import UIKit

class GuestsListTableViewCell: DidEnterLobbyTableViewCell {
    
    // MARK: methods
    
    func guestIsReady() {
        filmListLable.textColor = .systemGreen
    }
    
    func guestIsNotReady() {
        filmListLable.textColor = .systemRed
    }
    
}
