//
//  EnterLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 08.11.2023.
//

import Foundation
import UIKit

final class EnterLobbyController: UIViewController {
    
    private var isKeyboardUnactive = true
    
    var enterLobbyView = CreateLobbyView(frame: UIScreen.main.bounds, type: .enter)
    
    override func loadView() {
        self.view = enterLobbyView
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
        enterLobbyView.bottomButton.addTarget(self,
                                              action: #selector(enterButtonDidTapped),
                                              for: .touchUpInside)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapWholeView))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc func didTapWholeView() {
        view.endEditing(true)
    }
    
    func setupCleanTextFieldsButtons() {
        enterLobbyView.nameTextFieldButton.addTarget(self,
                                                       action: #selector(clearNameTextFieldButtonDidTapped),
                                                       for: .touchUpInside)
        enterLobbyView.lobbyTextFieldButton.addTarget(self,
                                                       action: #selector(clearLobbyTextFieldButtonDidTapped),
                                                       for: .touchUpInside)
    }
    
    @objc func clearNameTextFieldButtonDidTapped() {
        enterLobbyView.nameTextField.text = ""
    }
    
    @objc func clearLobbyTextFieldButtonDidTapped() {
        enterLobbyView.lobbyTextField.text = ""
    }
    
    @objc func enterButtonDidTapped() {
        let controller = DidEnteredLobbyController()
        controller.modalPresentationStyle = .fullScreen
//        present(controller, animated: true, completion: nil)
        navigationController?.pushViewController(controller, animated: true)
    }
}
