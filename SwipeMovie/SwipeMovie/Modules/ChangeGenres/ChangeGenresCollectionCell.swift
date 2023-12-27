//
// ChangeGenresCollectionCell.swift
// SwipeMovie
//
// Created by Егор Иванов on 24.12.2023.
//

import UIKit

final class ChangeGenresCollectionCell: UICollectionViewCell {
    // MARK: - private properties
    private enum Const {
        static let leadingConst: CGFloat = 16
        static let topConst: CGFloat = -10
        static let trailingConst: CGFloat = -15
        static let cornerRadius: CGFloat = 30
    }
    // MARK: - КНОПКА +
    private var addingButtonGenre: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(paletteColors: [.white, .systemGray])
//        let config = UIImage.SymbolConfiguration(paletteColors: [.white, .systemBlue])
        button.setImage(UIImage(systemName: "plus.circle.fill")?.withConfiguration(config), for: .normal)
        button.addTarget(self, action: #selector(addingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func addingButtonTapped() {
        LobbyManager.shared.addFilmListToLobby(filmListId: idOfFilmList)
        let config = UIImage.SymbolConfiguration(paletteColors: [.white, .systemGray])
        addingButtonGenre.setImage(UIImage(systemName: "checkmark.circle.fill")?.withConfiguration(config), for: .normal)
    }
    
    private var nameOfGenre: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 17)
        name.textColor = .black
        name.text = "Жанр фильмов"
        return name
    }()
    private var descriptionOfGenre: UILabel = {
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
    
    var idOfFilmList: String = ""
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameOfGenre)
        contentView.addSubview(descriptionOfGenre)
        contentView.addSubview(buttonGenre)
        contentView.addSubview(addingButtonGenre)
        contentView.backgroundColor = UIColor(named: "swipeMovieWhite")
        
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(id: String, name: String, description: String) {
        idOfFilmList = id
        nameOfGenre.text = name
        descriptionOfGenre.text = description
    }
}

// MARK: - layout
private extension ChangeGenresCollectionCell {
    func setupConstrains() {
        
        [nameOfGenre, descriptionOfGenre, buttonGenre,addingButtonGenre].forEach({ element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
        
        buttonGenre.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        buttonGenre.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            
            addingButtonGenre.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingConst),
            addingButtonGenre.topAnchor.constraint(equalTo: contentView.topAnchor),
            addingButtonGenre.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            addingButtonGenre.heightAnchor.constraint(equalToConstant: 30),
            addingButtonGenre.widthAnchor.constraint(equalToConstant: 30),
            
            buttonGenre.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonGenre.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingConst),
            
            nameOfGenre.topAnchor.constraint(equalTo: buttonGenre.topAnchor, constant: Const.topConst),
            nameOfGenre.trailingAnchor.constraint(equalTo: buttonGenre.leadingAnchor, constant: -10),
            nameOfGenre.leadingAnchor.constraint(equalTo: addingButtonGenre.trailingAnchor, constant: 20),
            
            descriptionOfGenre.topAnchor.constraint(equalTo: nameOfGenre.bottomAnchor),
            descriptionOfGenre.leadingAnchor.constraint(equalTo: addingButtonGenre.trailingAnchor, constant: 20),
            descriptionOfGenre.trailingAnchor.constraint(equalTo: buttonGenre.leadingAnchor, constant: -10)
        ])
        
    }
}
