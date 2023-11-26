//
//  TopTitleLobbiesView.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 25.11.2023.
//

import Foundation
import UIKit

final class TopTitleLobbiesView: UIView {
    
    // MARK: private types
    
    private enum ConstantsForTopTitle {
        
        static let subtitleFontSize: CGFloat = 22
        static let codeFontSize = subtitleFontSize
        static let spaceBetweenTitleAndSubtitle: CGFloat = 10
        static let marginFromBorders: CGFloat = 16
        static let spaceBetweenTextAndButtom: CGFloat = 12
        static let heightOfCodeView: CGFloat = 30
    }
    
    // MARK: properties
    
    var codeShareButton = UIButton()
    var titleLabel = CustomUILabel()
    var codeLabel = CustomUILabel()
    
    // MARK: methods
    
    func setNameAndCode(titleText: String, code: String) {
        titleLabel.text = titleText
        codeLabel.text = code
    }
    
    func makeTopView(lobbyName: String, lobbyCode: String) {
            
            let titlelabel = CustomUILabel()
            titlelabel.makeTitleLabel(text: lobbyName)
            super.addSubview(titlelabel)
            
            let subtitleLabel = CustomUILabel()
            subtitleLabel.makeSubtitleLabel(text: "Код лобби:")
            super.addSubview(subtitleLabel)
            
            let codeView = makeCodeView(lobbyCode: lobbyCode)
            super.addSubview(codeView)
            
            NSLayoutConstraint.activate([
                titlelabel.topAnchor.constraint(equalTo: super.topAnchor),
                titlelabel.centerXAnchor.constraint(equalTo: super.centerXAnchor),
                titlelabel.leadingAnchor.constraint(equalTo: super.leadingAnchor),
                
                subtitleLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor,
                                                   constant: ConstantsForTopTitle.spaceBetweenTitleAndSubtitle),
                subtitleLabel.trailingAnchor.constraint(equalTo: super.centerXAnchor,
                                                        constant: -ConstantsForTopTitle.marginFromBorders),
                
                codeView.leadingAnchor.constraint(equalTo: super.centerXAnchor),
                codeView.bottomAnchor.constraint(equalTo: super.bottomAnchor),
                codeView.centerYAnchor.constraint(equalTo: subtitleLabel.centerYAnchor)
            ])
    }
    
    // MARK: private methods
    
    private func makeCodeView(lobbyCode: String = "000000") -> UIView {
        
        let view = UIView()
        view.backgroundColor = UIColor(named: "swipeMovieWhite")
        view.layer.cornerRadius = ConstantsForTopTitle.heightOfCodeView / 2.0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let codeLabel = CustomUILabel()
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
