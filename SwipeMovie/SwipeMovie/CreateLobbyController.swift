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
    var createLobbyView = CreateLobbyView(frame: UIScreen.main.bounds, type: "create")
    override func loadView() {
        self.view = createLobbyView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCleanTextFieldsButtons()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didTapWholeView),
                                               name: UIApplication.didEnterBackgroundNotification,
                                               object: nil)
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapWholeView))
        view.addGestureRecognizer(recognizer)
    }
    @objc func didTapWholeView() {
        view.endEditing(true)
    }
    @objc func keyBoardWillShow(notification: NSNotification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardFrameInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else {
            return
        }
        let keyboardHeight = keyboardFrameInfo.cgRectValue.height
        if isKeyboardUnactive {
            isKeyboardUnactive.toggle()
            createLobbyView.createBottomButtonBottomConstraint?.constant -= keyboardHeight
            UIView.animate(withDuration: 1 / 4,
                           delay: 0,
                           animations: { self.view.layoutIfNeeded() })
        }
    }
    @objc func keyBoardWillHide(notification: NSNotification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardFrameInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else {
            return
        }
        let keyboardHeight = keyboardFrameInfo.cgRectValue.height
        if isKeyboardUnactive == false {
            isKeyboardUnactive.toggle()
            createLobbyView.createBottomButtonBottomConstraint?.constant += keyboardHeight
            UIView.animate(withDuration: 1 / 4,
                           delay: 0,
                           animations: { self.view.layoutIfNeeded() })
        }
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
}
