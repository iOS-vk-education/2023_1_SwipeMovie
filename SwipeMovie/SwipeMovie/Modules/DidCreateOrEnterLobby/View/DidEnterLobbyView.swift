//
//  DidEnteredLobbyView.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 19.11.2023.
//

import Foundation
import UIKit

class DidEnteredLobbyView: UIView {
    
    // MARK: private types
    
    private enum ConstantsForTopTitle {
        
        static let titleFontSize: CGFloat = ConstantsMain.mainLabelFontSize
        static let subtitleFontSize: CGFloat = 22
        static let codeFontSize = subtitleFontSize
        static let spaceBetweenTitleAndSubtitle: CGFloat = 10
        static let marginFromBorders: CGFloat = 16
        static let spaceBetweenTextAndButtom: CGFloat = 12
        static let heightOfCodeView: CGFloat = 30
    }
    
    private enum ConstantsForTable {
        
        static let titleFontSize: CGFloat = 22
        static let buttonFontSize: CGFloat = 17
        static let heightOfTable: CGFloat = 3.0 / 5.0 * UIScreen.main.bounds.height
        static let heightOfCellWithSpace: CGFloat = 52
        static let spaceBetweenTableAndLable: CGFloat = 16
    }
    
    // MARK: private properties
    
    private var foregroundView = UIView()
    private var captionLable = UILabel()
    
    // MARK: properties
    
    var bottomButton = UIButton()
    var filmListTableView = UITableView()
    
    // MARK: methods
    
    init(frame: CGRect, lobbyName: String, lobbyCode: String) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        configureTableView()
        configureForegroundView()
        configureTopView(lobbyName: lobbyName, lobbyCode: lobbyCode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private methods
    
    private func configureTableView() {
        
        let tableLabel: UILabel = {
            
            let label = UILabel()
            label.text = "Списки фильмов"
            label.font = UIFont.systemFont(ofSize: ConstantsForTable.titleFontSize,
                                           weight: .medium)
            label.textColor = UIColor(named: "swipeMovieWhite")
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        addSubview(tableLabel)
        
        filmListTableView.backgroundColor = UIColor(named: "swipeMovieBlue")
        filmListTableView.rowHeight = ConstantsForTable.heightOfCellWithSpace
        addSubview(filmListTableView)
        filmListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                constant: -ConstantsForTable.heightOfTable),
            tableLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                constant: ConstantsMain.marginFromSides),
            
            filmListTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                      constant: -50),
            // simple number to put last element of table under white foreground
            filmListTableView.topAnchor.constraint(equalTo: tableLabel.bottomAnchor,
                                                   constant: ConstantsForTable.spaceBetweenTableAndLable),
            filmListTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            filmListTableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    // function of setting up white foreground of this view and it's constraints
    private func configureForegroundView() {
        
        foregroundView = .makeForegroundView()
        foregroundView.layer.borderColor = UIColor(named: "swipeMovieBlue")?.cgColor
        foregroundView.layer.borderWidth = ConstantsForWhiteForegroundView.borderWidth
        foregroundView.layer.cornerRadius += foregroundView.layer.borderWidth
        addSubview(foregroundView)
        
        bottomButton = .makeButton(title: "Готов",
                                   size: .ordinary)
        foregroundView.addSubview(bottomButton)
        
        NSLayoutConstraint.activate([
            foregroundView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,
                                                 constant: -foregroundView.layer.borderWidth),
            foregroundView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            foregroundView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                   constant: foregroundView.layer.borderWidth),
            
            bottomButton.centerXAnchor.constraint(equalTo: foregroundView.centerXAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                 constant: ConstantsMain.bottomIndent),
            
            foregroundView.topAnchor.constraint(equalTo: bottomButton.topAnchor,
                                                constant: 3 * ConstantsMain.bottomIndent)
        ])
    }
    
    private func configureTopView(lobbyName: String, lobbyCode: String) {
        
        let topView: UIView = {
            let view = UIView()
            
            let titlelabel = makeTitleLabel(titleText: lobbyName)
            view.addSubview(titlelabel)
            
            let subtitleLabel = makeSubtitleLabel(subtitleText: "Код лобби:")
            view.addSubview(subtitleLabel)
            
            let codeView = makeCodeView(lobbyCode: lobbyCode)
            view.addSubview(codeView)
            
            NSLayoutConstraint.activate([
                titlelabel.topAnchor.constraint(equalTo: view.topAnchor),
                titlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                
                subtitleLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor,
                                                   constant: ConstantsForTopTitle.spaceBetweenTitleAndSubtitle),
                subtitleLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor,
                                                        constant: -ConstantsForTopTitle.marginFromBorders),
                
                codeView.leadingAnchor.constraint(equalTo: view.centerXAnchor),
                codeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                codeView.centerYAnchor.constraint(equalTo: subtitleLabel.centerYAnchor)
            ])
            
            return view
        }()
        
        self.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        let dimensionBefore = safeAreaLayoutGuide.topAnchor.anchorWithOffset(to: topView.centerYAnchor)
        let dimensionAfter = topView.centerYAnchor.anchorWithOffset(to: filmListTableView.topAnchor)
        
        NSLayoutConstraint.activate([
            dimensionBefore.constraint(equalTo: dimensionAfter, constant: -40),
            topView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            topView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                              constant: ConstantsMain.marginFromSides)
        ])
    }
    
    private func makeTitleLabel(titleText: String = "error") -> UILabel {
        
        let label = UILabel()
        
        label.textColor = UIColor(named: "swipeMovieWhite")
        label.font = UIFont.systemFont(ofSize: ConstantsForTopTitle.titleFontSize, weight: .bold)
        label.text = titleText
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func makeSubtitleLabel(subtitleText: String = "error") -> UILabel {
        
        let label = UILabel()
        
        label.textColor = UIColor(named: "swipeMovieWhite")
        label.font = UIFont.systemFont(ofSize: ConstantsForTopTitle.subtitleFontSize, weight: .regular)
        label.text = subtitleText
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func makeCodeView(lobbyCode: String = "000000") -> UIView {
        
        let view = UIView()
        view.backgroundColor = UIColor(named: "swipeMovieWhite")
        view.layer.cornerRadius = ConstantsForTopTitle.heightOfCodeView / 2.0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let codeLabel = makeSubtitleLabel(subtitleText: lobbyCode)
        codeLabel.textColor = .systemBlue
        view.addSubview(codeLabel)
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: ConstantsForTopTitle.heightOfCodeView),
            
            codeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            codeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: ConstantsForTopTitle.marginFromBorders)
        ])
        
        return view
    }
}
