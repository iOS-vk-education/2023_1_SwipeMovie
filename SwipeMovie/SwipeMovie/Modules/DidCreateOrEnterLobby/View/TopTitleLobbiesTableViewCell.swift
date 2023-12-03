//
//  TopTitleLobbiesTableViewCell.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 03.12.2023.
//

import UIKit

class TopTitleLobbiesTableViewCell: UITableViewCell {
    
    // MARK: private types
    
    private enum ConstantsForTopTitle {
        
        static let subtitleFontSize: CGFloat = 22
        static let codeFontSize = subtitleFontSize
        static let spaceBetweenTitleAndSubtitle: CGFloat = 10
        static let marginFromBorders: CGFloat = 16
        static let spaceBetweenTextAndButtom: CGFloat = 12
        static let heightOfCodeView: CGFloat = 30
        static let marginFromBottomAndTop: CGFloat = 40
    }
    
    // MARK: properties
    
    var codeShareButton = UIButton()
    var filmListsButton = UIButton()
    var titleLabel = CustomUILabel()
    var codeLabel = CustomUILabel()
    
    // MARK: methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        makeTopView(lobbyName: "12", lobbyCode: "12")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNameAndCode(titleText: String, code: String) {
        titleLabel.text = titleText
        codeLabel.text = code
    }
    
    func makeTopView(lobbyName: String, lobbyCode: String) {
            
        titleLabel.makeTitleLabel(text: lobbyName)
        addSubview(titleLabel)
        
        let subtitleLabel = CustomUILabel()
        subtitleLabel.makeSubtitleLabel(text: "Код лобби:")
        addSubview(subtitleLabel)
            
        let codeView = makeCodeView(lobbyCode: lobbyCode)
        addSubview(codeView)
        
        let tableLabel = CustomUILabel()
        tableLabel.makeSubtitleLabel(text: "Списки фильмов")
        tableLabel.font = UIFont.systemFont(ofSize: tableLabel.font.pointSize,
                                            weight: .medium)
        addSubview(tableLabel)
        
        filmListsButton.setTitle("Изменить", for: .normal)
        filmListsButton.setTitleColor(UIColor(named: "swipeMovieWhite"), for: .normal)
        addSubview(filmListsButton)
        filmListsButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor,
                                                constant: ConstantsForTopTitle.marginFromBottomAndTop),
                titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                   constant: ConstantsForTopTitle.spaceBetweenTitleAndSubtitle),
                subtitleLabel.trailingAnchor.constraint(equalTo: centerXAnchor,
                                                        constant: -ConstantsForTopTitle.marginFromBorders),
                
                codeView.leadingAnchor.constraint(equalTo: centerXAnchor),
                codeView.centerYAnchor.constraint(equalTo: subtitleLabel.centerYAnchor),
                
                tableLabel.topAnchor.constraint(equalTo: codeView.bottomAnchor,
                                                constant: ConstantsForTopTitle.marginFromBottomAndTop),
                tableLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                tableLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                    constant: ConstantsForAllViews.marginFromSides),
                
                filmListsButton.centerYAnchor.constraint(equalTo: tableLabel.centerYAnchor),
                filmListsButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                    constant: -ConstantsForAllViews.marginFromSides)
            ])
    }
    
    // MARK: private methods
    
    private func makeCodeView(lobbyCode: String = "000000") -> UIView {
        
        let view = UIView()
        view.backgroundColor = UIColor(named: "swipeMovieWhite")
        view.layer.cornerRadius = ConstantsForTopTitle.heightOfCodeView / 2.0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        codeLabel.makeSubtitleLabel(text: lobbyCode)
        codeLabel.textColor = .systemBlue
        view.addSubview(codeLabel)
        
        codeShareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        codeShareButton.tintColor = .systemBlue
        codeShareButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(codeShareButton)
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: ConstantsForTopTitle.heightOfCodeView),
            
            codeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            codeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: ConstantsForTopTitle.marginFromBorders),
            
            codeShareButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            codeShareButton.leadingAnchor.constraint(equalTo: codeLabel.trailingAnchor,
                                            constant: ConstantsForTopTitle.spaceBetweenTextAndButtom),
            codeShareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                             constant: -ConstantsForTopTitle.heightOfCodeView / 2.0)
        ])
        
        return view
    }
}
