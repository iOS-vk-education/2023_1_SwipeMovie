//
//  FilmGenreCollectionViewCell.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 19.11.2023.
//

import UIKit
import Kingfisher

struct InfoCellModelGenre {
    let name: String
    let description: String
}

final class FilmGenreCollectionViewCell: UICollectionViewCell {
    // MARK: - private properties
    private enum Const {
        static let leadingConst: CGFloat = 16
        static let topConst: CGFloat = 22.5
        static let trailingConst: CGFloat = -15
        static let cornerRadius: CGFloat = 30
    }
    
    private let nameOfGenre: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 17)
        name.textColor = .black
        return name
    }()
    private let descriptionOfGenre: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 15)
        name.textColor = .gray
        name.numberOfLines = 2
        return name
    }()
    
    private let buttonGenre: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Все фильмы > ", for: .normal)
        return button
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameOfGenre)
        contentView.addSubview(descriptionOfGenre)
        contentView.addSubview(buttonGenre)
        contentView.backgroundColor = UIColor(named: "swipeMovieCollectionViewCell")
        
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - layout
private extension FilmGenreCollectionViewCell {
    func setupConstrains() {
        
        [nameOfGenre, descriptionOfGenre, buttonGenre].forEach({element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
        
        buttonGenre.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        buttonGenre.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            
            buttonGenre.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonGenre.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingConst),
            
            nameOfGenre.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.topConst),
            nameOfGenre.trailingAnchor.constraint(equalTo: buttonGenre.leadingAnchor, constant: -10),
            nameOfGenre.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leadingConst),
            
            descriptionOfGenre.topAnchor.constraint(equalTo: nameOfGenre.bottomAnchor),
            descriptionOfGenre.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leadingConst),
            descriptionOfGenre.trailingAnchor.constraint(equalTo: buttonGenre.leadingAnchor, constant: -10)
        ])
        
    }
}

extension FilmGenreCollectionViewCell {
    func updateInfoGenre(with info: InfoCellModelGenre) {
        nameOfGenre.text = info.name
        descriptionOfGenre.text = info.description
    }
}
