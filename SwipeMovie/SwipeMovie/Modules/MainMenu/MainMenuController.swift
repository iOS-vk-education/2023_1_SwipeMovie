//
//  ViewController.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 26.10.2023.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    private let uuu = UserManager.shared
    
    private let lll = LobbyManager.shared
    
    private let rrr = LobbyResultManager.shared
    
    private let fff = FilmsListManager.shared
    
    private var createMainMenuView = MainMenuView(frame: UIScreen.main.bounds)
    
    override func loadView() {
        super.loadView()
        self.view = createMainMenuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpButtonTargets()
        setUpNavigation()
        FilmsListManager.shared.getAllFilmListsAndFilms()
    }
    
    func setUpButtonTargets() {
        createMainMenuView.createLobbyButton.addTarget(
            self,
            action: #selector(createButtonDidTapped),
            for: .touchUpInside)
        createMainMenuView.joinLobbyButton.addTarget(
            self,
            action: #selector(joinButtonDidTapped),
            for: .touchUpInside)
    }
    
    func setUpNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "swipeMovieWhite")
    }
    
    @objc
    func createButtonDidTapped() {
        let controller = WillCreateLobbyController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    func joinButtonDidTapped() {
        let controller = WillEnterLobbyController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
