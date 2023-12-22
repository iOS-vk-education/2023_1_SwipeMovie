//
//  TopTitleLobbiesTableViewCell.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 03.12.2023.
//

import UIKit

class TopTitleLobbiesTableViewCell: UITableViewCell {
    
    // MARK: types
    
     enum TitleType {
        case create
        case enter
    }
    
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
    
    // MARK: private properties

    private var titleLabel = CustomUILabelBuilderByType(type: .title)
    private var codeLabel = CustomUILabelBuilderByType(type: .subtitle)
    
    // MARK: methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        makeTopView(lobbyName: "12", lobbyCode: "12")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(titleText: String, code: String, type: TitleType) {
        
        titleLabel.text = titleText
        codeLabel.text = code
        
        switch type {
        case .create:
            filmListsButton.isHidden = false
            filmListsButton.isEnabled = true
        case .enter:
            filmListsButton.isHidden = true
            filmListsButton.isEnabled = false
        }
        
    }
    
    func makeTopView(lobbyName: String, lobbyCode: String) {
            
        contentView.addSubview(titleLabel)
        
        let subtitleLabel = CustomUILabelBuilderByType(type: .subtitle)
        subtitleLabel.text = "Код лобби:"
        contentView.addSubview(subtitleLabel)
            
        let codeView = makeCodeView(lobbyCode: lobbyCode)
        contentView.addSubview(codeView)
        
        let tableLabel = CustomUILabelBuilderByType(type: .subtitle)
        tableLabel.text = "Списки фильмов"
        tableLabel.font = UIFont.systemFont(ofSize: tableLabel.font.pointSize,
                                            weight: .medium)
        contentView.addSubview(tableLabel)
        
        filmListsButton.setTitle("Изменить", for: .normal)
        filmListsButton.setTitleColor(UIColor(named: "swipeMovieWhite"), for: .normal)
        contentView.addSubview(filmListsButton)
        filmListsButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                                constant: ConstantsForTopTitle.marginFromBottomAndTop),
                titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                   constant: ConstantsForTopTitle.spaceBetweenTitleAndSubtitle),
                subtitleLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor,
                                                        constant: -ConstantsForTopTitle.marginFromBorders),
                
                codeView.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
                codeView.centerYAnchor.constraint(equalTo: subtitleLabel.centerYAnchor),
                
                tableLabel.topAnchor.constraint(equalTo: codeView.bottomAnchor,
                                                constant: ConstantsForTopTitle.marginFromBottomAndTop),
                tableLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                tableLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: ConstantsForAllViews.marginFromSides),
                
                filmListsButton.centerYAnchor.constraint(equalTo: tableLabel.centerYAnchor),
                filmListsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                    constant: -ConstantsForAllViews.marginFromSides)
            ])
    }
    
    // MARK: private methods
    
    private func makeCodeView(lobbyCode: String = "000000") -> UIView {
        
        let view = UIView()
        view.backgroundColor = UIColor(named: "swipeMovieWhite")
        view.layer.cornerRadius = ConstantsForTopTitle.heightOfCodeView / 2.0
        view.translatesAutoresizingMaskIntoConstraints = false
        
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
