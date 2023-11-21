//
//  CreateLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 29.10.2023.
//

import Foundation
import UIKit

final class CreateLobbyController: UIViewController {
    
    private var isKeyboardUnactive = true
    
    private var createLobbyView = CreateLobbyView(frame: UIScreen.main.bounds, type: .create)
    
    override func loadView() {
        self.view = createLobbyView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(named: "swipeMovieWhite")
        setupCleanTextFieldsButtons()
        createLobbyView.bottomButton.addTarget(self,
                                               action: #selector(createButtonDidTapped),
                                               for: .touchUpInside)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapWholeView))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc func didTapWholeView() {
        view.endEditing(true)
    }
    
    func setupCleanTextFieldsButtons() {
        createLobbyView.nameTextFieldButton.addTarget(self,
                                                       action: #selector(clearNameTextFieldButtonDidTapped),
                                                       for: .touchUpInside)
        createLobbyView.lobbyTextFieldButton.addTarget(self,
                                                       action: #selector(clearLobbyTextFieldButtonDidTapped),
                                                       for: .touchUpInside)
    }
    
    @objc func clearNameTextFieldButtonDidTapped() {
        createLobbyView.nameTextField.text = ""
    }
    
    @objc func clearLobbyTextFieldButtonDidTapped() {
        createLobbyView.lobbyTextField.text = ""
    }
    
    @objc func createButtonDidTapped() {
        let controller = DidCreatedLobbyController()
        controller.modalPresentationStyle = .fullScreen
//        present(controller, animated: true, completion: nil)
        navigationController?.pushViewController(controller, animated: true)
    }
}
