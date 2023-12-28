//
//  WillCreateOrEnterLobbyView.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 08.11.2023.
//

import Foundation
import UIKit

class WillCreateOrEnterLobbyView: UIView {
    
    // MARK: types
    
    enum ViewType {
        case create
        case enter
    }
    
    // MARK: private types
    
    private enum ConstantsForTextFields {
        
        static let height: CGFloat = 44
        static let borderWidth: CGFloat = 2
        static let fontSize: CGFloat = 17
        static let labelFontSize: CGFloat = 22
        static let margingFromBorder: CGFloat = 32
        static let spaceUnderLabel: CGFloat = 8
        static let cornerRadius: CGFloat = 20
        static let fullHeight: CGFloat = height + spaceUnderLabel + labelFontSize
        static let spaceBetweenTextFieldsWithLabels: CGFloat = 10
    }

    // MARK: properties
    
    var bottomButton = CustomUIButtonBuilderByType(title: "", type: .smallRounded)
    var nameTextFieldButton = UIButton()
    var lobbyTextFieldButton = UIButton()
    
    var nameTextField = UITextField()
    var lobbyTextField = UITextField()
    
    // MARK: private properties
    
    private var topLabel = CustomUILabelBuilderByType(type: .title )
    private var foregroundView = CustomForegroundViewBuilderByType(type: .bottomWithoutBorder)
    private var nameStack = UIStackView()
    private var lobbyStack = UIStackView()
    
    // MARK: methods
    
    init(frame: CGRect, type: ViewType) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "swipeMovieBlue")
        
        switch type {
        case .create:
            configureForegroundView(bottomTitle: "Введите название лобби",
                                    bottomPlaceHolder: "Название",
                                    buttonTitle: "Создать")
            topLabel.makeText(text: "Создать лобби")
            
        case .enter:
            configureForegroundView(bottomTitle: "Введите код лобби",
                                    bottomPlaceHolder: "••••••",
                                    buttonTitle: "Присоединиться")
            topLabel.makeText(text: "Присоединиться к лобби")
        }
        
        configureCreateLobbyLabel()
        bottomButton.blockButton1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private methods
    
    // function of setting up white foreground of this view
    
    private func configureForegroundView(bottomTitle: String = "Error",
                                         bottomPlaceHolder: String = "Error",
                                         buttonTitle: String = "Error") {

        nameStack = makeTextView(textField: nameTextField,
                                 title: "Введите Ваше имя",
                                 placeholder: "Имя",
                                 button: nameTextFieldButton)
        nameStack.translatesAutoresizingMaskIntoConstraints = false
        
        lobbyStack = makeTextView(textField: lobbyTextField,
                                  title: bottomTitle,
                                  placeholder: bottomPlaceHolder,
                                  button: lobbyTextFieldButton)
        lobbyStack.translatesAutoresizingMaskIntoConstraints = false
        
        bottomButton.setTitle(buttonTitle, for: .normal)
        
        configureConstraintsOfForegroundViewConstraints()
    }
    
    // function of setting up constraints of white foreground of this view
    
    private func configureConstraintsOfForegroundViewConstraints() {
        
        self.addSubview(foregroundView)
        foregroundView.addSubview(nameStack)
        foregroundView.addSubview(lobbyStack)
        foregroundView.addSubview(bottomButton)
        
        NSLayoutConstraint.activate([
            foregroundView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            foregroundView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            foregroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameStack.topAnchor.constraint(equalTo: foregroundView.topAnchor,
                                           constant: foregroundView.layer.cornerRadius / 2),
            nameStack.leadingAnchor.constraint(equalTo: foregroundView.leadingAnchor,
                                                constant: ConstantsForAllViews.marginFromSides),
            nameStack.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor),
            
            lobbyStack.topAnchor.constraint(equalTo: nameStack.bottomAnchor,
                                            constant: ConstantsForTextFields.spaceBetweenTextFieldsWithLabels),
            lobbyStack.leadingAnchor.constraint(equalTo: nameStack.leadingAnchor),
            lobbyStack.centerXAnchor.constraint(equalTo: nameStack.centerXAnchor),
            
            bottomButton.topAnchor.constraint(equalTo: lobbyStack.bottomAnchor,
                                              constant: ConstantsForTextFields.spaceBetweenTextFieldsWithLabels),
            bottomButton.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor,
                                                 constant: ConstantsForAllViews.bottomIndent)
        ])
    }
    
    // function of setting up label of this view and it's constraints
    
    private func configureCreateLobbyLabel() {
        
        self.addSubview(topLabel)
        
        let dimensionBefore = self.safeAreaLayoutGuide.topAnchor.anchorWithOffset(to: topLabel.centerYAnchor)
        let dimensionAfter = topLabel.centerYAnchor.anchorWithOffset(to: foregroundView.topAnchor)
        
        NSLayoutConstraint.activate([
            dimensionBefore.constraint(equalTo: dimensionAfter),
            topLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            topLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                              constant: ConstantsForAllViews.marginFromSides)
        ])
    }
    
    // function of setting up textField with it's label and view
    
    private func makeTextView(textField: UITextField,
                              title: String,
                              placeholder: String,
                              button: UIButton) -> UIStackView {
        
        textField.placeholder = placeholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let textFieldView: UIView = {
            
            let view = UIView()
            
            view.layer.cornerRadius = ConstantsForTextFields.cornerRadius
            view.layer.borderColor = UIColor(named: "swipeMovieBlue")?.cgColor
            view.layer.borderWidth = 2
            view.addSubview(textField)
            view.addSubview(button)
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: ConstantsForTextFields.height),
                
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                button.widthAnchor.constraint(equalToConstant: ConstantsForTextFields.height),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                textField.topAnchor.constraint(equalTo: view.topAnchor),
                textField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: ConstantsForTextFields.margingFromBorder),
                textField.trailingAnchor.constraint(equalTo: button.leadingAnchor)
            ])
            
            return view
        }()
        
        let titleLabel: UILabel = {

            let label = UILabel()

            label.text = title
            label.textColor = UIColor(named: "swipeMovieBlack")
            label.font = UIFont.systemFont(ofSize: ConstantsForTextFields.labelFontSize)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            return label
        }()
        
        let textFieldStack: UIStackView = {
            
            let stack = UIStackView()
            
            stack.axis = .vertical
            stack.spacing = ConstantsForTextFields.spaceUnderLabel
            stack.addArrangedSubview(titleLabel)
            stack.addArrangedSubview(textFieldView)
            titleLabel.bottomAnchor.constraint(equalTo: textFieldView.topAnchor,
                                               constant: -ConstantsForTextFields.spaceUnderLabel).isActive = true

            return stack
        }()
        
        return textFieldStack
    }
}
