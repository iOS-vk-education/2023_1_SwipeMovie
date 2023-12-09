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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "swipeMovieWhite")
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
        let controller = MoviePageViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    func joinButtonDidTapped() {
        //
    }
}
