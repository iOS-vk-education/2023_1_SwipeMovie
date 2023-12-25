//
// GenreListCollectionViewCell.swift
// SwipeMovie
//
// Created by Егор Иванов on 24.12.2023.
//

import UIKit

final class GenreListCollectionViewCell: UICollectionViewCell {
    // MARK: - private properties
    private enum Const {
        static let leadingConst: CGFloat = 16
        static let topConst: CGFloat = -10
        static let trailingConst: CGFloat = -15
        static let cornerRadius: CGFloat = 30
    }
    
    private let nameOfGenre: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 17)
        name.textColor = .black
        name.text = "Жанр фильма"
        return name
    }()
    private let descriptionOfGenre: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 15)
        name.textColor = .gray
        name.text = "Описание"
        name.numberOfLines = 2
        return name
    }()
    
    private let buttonGenre: UILabel = {
        let button = UILabel()
        button.text = "Все фильмы >"
        button.textColor = .systemBlue
        return button
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameOfGenre)
        contentView.addSubview(descriptionOfGenre)
        contentView.addSubview(buttonGenre)
        contentView.backgroundColor = UIColor(named: "swipeMovieWhite")
        
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - layout
private extension GenreListCollectionViewCell {
    func setupConstrains() {
        
        [nameOfGenre, descriptionOfGenre, buttonGenre].forEach({element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
        
        buttonGenre.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        buttonGenre.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            buttonGenre.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonGenre.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingConst),
            
            nameOfGenre.topAnchor.constraint(equalTo: buttonGenre.topAnchor, constant: Const.topConst),
            nameOfGenre.trailingAnchor.constraint(equalTo: buttonGenre.leadingAnchor, constant: -10),
            nameOfGenre.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leadingConst),
            
            descriptionOfGenre.topAnchor.constraint(equalTo: nameOfGenre.bottomAnchor),
            descriptionOfGenre.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leadingConst),
            descriptionOfGenre.trailingAnchor.constraint(equalTo: buttonGenre.leadingAnchor, constant: -10)
        ])
        
    }
}
