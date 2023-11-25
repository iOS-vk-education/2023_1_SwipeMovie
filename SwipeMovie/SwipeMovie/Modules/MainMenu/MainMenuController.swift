//
//  ViewController.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 26.10.2023.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    private var createMainMenuView = MainMenuView(frame: UIScreen.main.bounds)
    
    override func loadView() {
        super.loadView()
        self.view = createMainMenuView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtonTargets()
    }
    
    func setUpButtonTargets() {
        createMainMenuView.createLobbyButton.addTarget(
            self,
            action: #selector(createButtonDidTapped),
            for: .touchUpInside)
        createMainMenuView.joinLobbyButton.addTarget(
            self,
            action: #selector(joinButtonDidTapped),
            for: .allTouchEvents)
    }
    
    @objc
    func createButtonDidTapped() {
        //
    }
    
    @objc
    func joinButtonDidTapped() {
        //
    }

}
