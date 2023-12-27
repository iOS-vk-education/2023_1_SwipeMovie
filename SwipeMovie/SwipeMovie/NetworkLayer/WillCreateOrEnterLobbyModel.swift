//
//  WillCreateOrEnterLobbyModel.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 23.12.2023.
//

import Foundation

final class WillCreateOrEnterLobbyModel {
    
    // MARK: properties
    
    var name: String = ""
    var code: String = ""
    
    // MARK: private properties
    
    private let userManager = UserManager.shared
    private let lobbyManager = LobbyManager.shared
    
    // MARK: methods
    
    init() {
        getNameOfUser()
        code = generateCodeOfLobby()
    }
    
    private func getNameOfUser() {
        name = userManager.user.name
    }
    
    private func generateCodeOfLobby() -> String {
        String(Int.random(in: 100000..<1000000))
    }
}
