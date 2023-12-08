//
//  WillCreateLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 29.10.2023.
//

import Foundation
import UIKit

final class WillCreateLobbyController: UIViewController {
    
    // MARK: private properties
    
    private var createLobbyView = WillCreateLobbyView(frame: UIScreen.main.bounds, type: .create)
    
    // MARK: methods
    
    override func loadView() {
        super.loadView()
        
        self.view = createLobbyView
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
        navigationController?.navigationBar.tintColor = UIColor(named: "swipeMovieWhite")
        
        setupCleanTextFieldsButtons()
        createLobbyView.bottomButton.addTarget(self,
                                               action: #selector(createButtonDidTapped),
                                               for: .touchUpInside)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapWholeView))
        view.addGestureRecognizer(recognizer)
    }
    
    // MARK: private methods
    
    // TODO: this is temp function
    
    private func getNameOfLobby() -> String {
        createLobbyView.lobbyTextField.text == "" || createLobbyView.lobbyTextField.text == nil ? "No name"
        : createLobbyView.lobbyTextField.text!
    }
    
    // TODO: this is temp function
    
    private func generateCodeOfLobby() -> String {
        String(Int.random(in: 100000..<1000000))
    }
    
    @objc private func didTapWholeView() {
        view.endEditing(true)
    }
    
    private func setupCleanTextFieldsButtons() {
        createLobbyView.nameTextFieldButton.addTarget(self,
                                                       action: #selector(clearNameTextFieldButtonDidTapped),
                                                       for: .touchUpInside)
        createLobbyView.lobbyTextFieldButton.addTarget(self,
                                                       action: #selector(clearLobbyTextFieldButtonDidTapped),
                                                       for: .touchUpInside)
    }
    
    @objc private func clearNameTextFieldButtonDidTapped() {
        createLobbyView.nameTextField.text = ""
    }
    
    @objc private func clearLobbyTextFieldButtonDidTapped() {
        createLobbyView.lobbyTextField.text = ""
    }
    
    @objc private func createButtonDidTapped() {
        
        let controller = DidCreateLobbyController()
        controller.setTitleLabelText(text: getNameOfLobby(),
                                     code: generateCodeOfLobby())
//        present(controller, animated: true, completion: nil)
        navigationController?.pushViewController(controller, animated: true)
    }
}
