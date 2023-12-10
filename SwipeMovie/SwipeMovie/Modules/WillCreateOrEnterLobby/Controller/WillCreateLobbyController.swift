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
    
        createLobbyView.nameTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        createLobbyView.nameTextField.delegate = self
        
        createLobbyView.lobbyTextField.keyboardType = .default
        createLobbyView.lobbyTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        createLobbyView.lobbyTextField.delegate = self
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

extension WillCreateLobbyController {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else { return false }
        
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
            
        return count <= 20
        }
}
