//
//  WillEnterLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 08.11.2023.
//

import Foundation
import UIKit

final class WillEnterLobbyController: UIViewController, UITextFieldDelegate {
    
    // MARK: private properties
    
    private var enterLobbyView = WillCreateOrEnterLobbyView(frame: UIScreen.main.bounds, type: .enter)
    
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
        
        configureNavigation()
        configureButtonFunctionality()
        
        configureTextFields()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapWholeView))
        view.addGestureRecognizer(recognizer)
    }
    
    // MARK: private methods
    
    private func configureNavigation() {
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor(named: "swipeMovieWhite")
    }
    
    private func configureButtonFunctionality() {
        
        setupCleanTextFieldsButtons()
        enterLobbyView.bottomButton.addTarget(self,
                                              action: #selector(enterButtonDidTapped),
                                              for: .touchUpInside)
    }
    
    private func setupCleanTextFieldsButtons() {
        enterLobbyView.nameTextFieldButton.addTarget(self,
                                                       action: #selector(clearNameTextFieldButtonDidTapped),
                                                       for: .touchUpInside)
        enterLobbyView.lobbyTextFieldButton.addTarget(self,
                                                       action: #selector(clearLobbyTextFieldButtonDidTapped),
                                                       for: .touchUpInside)
    }
    
    private func configureTextFields() {
        
        enterLobbyView.nameTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        enterLobbyView.nameTextField.delegate = self

        enterLobbyView.lobbyTextField.keyboardType = .asciiCapableNumberPad
        enterLobbyView.lobbyTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        enterLobbyView.lobbyTextField.delegate = self
    }
    
    @objc private func clearNameTextFieldButtonDidTapped() {
        enterLobbyView.nameTextField.text = ""
    }
    
    @objc private func clearLobbyTextFieldButtonDidTapped() {
        enterLobbyView.lobbyTextField.text = ""
    }
    
    @objc private func enterButtonDidTapped() {
        
        let controller = DidEnterLobbyController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func didTapWholeView() {
        view.endEditing(true)
    }
}

extension WillEnterLobbyController {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else { return false }
        
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        let numberOfDigits = textField == enterLobbyView.nameTextField ? 20 : 6
            
        return count <= numberOfDigits
        }
}
