//
//  WillEnterLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 08.11.2023.
//

import Foundation
import UIKit

final class WillEnterLobbyController: UIViewController {
    
    // MARK: private properties
    
    private var enterLobbyView = WillCreateLobbyView(frame: UIScreen.main.bounds, type: .enter)
    
    // MARK: methods
    
    override func loadView() {
        super.loadView()
        
        self.view = enterLobbyView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(named: "swipeMovieWhite")
        
        setupCleanTextFieldsButtons()
        enterLobbyView.bottomButton.addTarget(self,
                                              action: #selector(enterButtonDidTapped),
                                              for: .touchUpInside)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapWholeView))
        view.addGestureRecognizer(recognizer)
    }
    
    // MARK: private methods
    
    @objc private func didTapWholeView() {
        view.endEditing(true)
    }
    
    private func setupCleanTextFieldsButtons() {
        enterLobbyView.nameTextFieldButton.addTarget(self,
                                                       action: #selector(clearNameTextFieldButtonDidTapped),
                                                       for: .touchUpInside)
        enterLobbyView.lobbyTextFieldButton.addTarget(self,
                                                       action: #selector(clearLobbyTextFieldButtonDidTapped),
                                                       for: .touchUpInside)
    }
    
    @objc private func clearNameTextFieldButtonDidTapped() {
        enterLobbyView.nameTextField.text = ""
    }
    
    @objc private func clearLobbyTextFieldButtonDidTapped() {
        enterLobbyView.lobbyTextField.text = ""
    }
    
    @objc private func enterButtonDidTapped() {
        
        let controller = DidEnterLobbyController()
        
//        controller.modalPresentationStyle = .fullScreen
//        present(controller, animated: true, completion: nil)
        navigationController?.pushViewController(controller, animated: true)
    }
}
