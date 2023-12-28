//
//  WillCreateLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 29.10.2023.
//

import Foundation
import UIKit

final class WillCreateLobbyController: UIViewController, UITextFieldDelegate {
    
    // MARK: private properties
    
    private let createLobbyModel = WillCreateOrEnterLobbyModel()
    
    private var createLobbyView = WillCreateOrEnterLobbyView(frame: UIScreen.main.bounds, type: .create)
    
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
        
        configureNavigation()
        configureButtonFunctionality()
        configureTextFields()
        
        createLobbyView.lobbyTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        createLobbyView.nameTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapWholeView))
        view.addGestureRecognizer(recognizer)
    }
    
    // MARK: private methods
    
    // TODO: this is temp function
    
    private func getNameOfLobby() -> String {
        
        createLobbyView.lobbyTextField.text == "" || createLobbyView.lobbyTextField.text == nil ? "No name"
        : createLobbyView.lobbyTextField.text!
    }
    
    private func configureNavigation() {
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor(named: "swipeMovieWhite")
    }
    
    private func configureButtonFunctionality() {
        
        setupCleanTextFieldsButtons()
        createLobbyView.bottomButton.addTarget(self,
                                               action: #selector(createButtonDidTapped),
                                               for: .touchUpInside)
    }
    
    private func configureTextFields() {
        
        createLobbyView.nameTextField.text = createLobbyModel.name
        createLobbyView.nameTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        createLobbyView.nameTextField.delegate = self
        
        createLobbyView.lobbyTextField.keyboardType = .default
        createLobbyView.lobbyTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        createLobbyView.lobbyTextField.delegate = self
    }
    
    @objc private func textFieldsDidChange() {
        if createLobbyView.lobbyTextField.text?.count ?? 0 > 0 && createLobbyView.lobbyTextField.text?.count ?? 0 > 0 {
            createLobbyView.bottomButton.unblockButton1()
        } else {
            createLobbyView.bottomButton.blockButton1()
        }
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
        createLobbyView.bottomButton.blockButton1()
    }
    
    @objc private func clearLobbyTextFieldButtonDidTapped() {
        createLobbyView.lobbyTextField.text = ""
        createLobbyView.bottomButton.blockButton1()
    }
    
    @objc private func createButtonDidTapped() {
        
        UserManager.shared.user.name = createLobbyView.nameTextField.text ?? "ErrorName"
        UserManager.shared.sendUser()
        LobbyManager.shared.lobby.firstLobbySetUp(name: "", code: createLobbyModel.code)
        LobbyManager.shared.getLobby(code: createLobbyModel.code, completion: {})
            
        let controller = DidCreateLobbyController()
        LobbyManager.shared.lobby.name = self.getNameOfLobby()
        controller.setTitleLabelText(text: LobbyManager.shared.lobby.name,
                                     code: LobbyManager.shared.lobby.code)
        LobbyManager.shared.createLobby()
//        present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension WillCreateLobbyController {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else { return false }
        
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
            
        return count <= 20
        }
}
