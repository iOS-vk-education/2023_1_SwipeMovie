//
//  FilmListCollectionViewCell.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 24.12.2023.
//

import UIKit

class FilmListCollectionViewCell: UICollectionViewCell {
    // MARK: - private properties
    private enum Const {
        static let leadingConst: CGFloat = 16
        
        static let topConst: CGFloat = 14
        
        static let nameTopConst: CGFloat = 22.5
        
        static let trailingConst: CGFloat = -15
        
        static let widhtConstImage: CGFloat = 77
        
        static let heightConstImage: CGFloat = 58
        
        static let cornerRadius: CGFloat = 30
        
        static let bottomConst: CGFloat = -16
    }
    
    private let filmImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "AppIcon")
        
        return image
    }()
    
    private let nameOfFilm: UILabel = {
        let name = UILabel()
        
        name.font = UIFont.systemFont(ofSize: 17)
        
        name.text = "Фильм"
        
        name.textColor = .black
        
        return name
    }()
    private let descriptionFilm: UILabel = {
        let name = UILabel()
        
        name.font = UIFont.systemFont(ofSize: 15)
        
        name.text = "Описание фильма"
        
        name.textColor = .gray
        
        name.numberOfLines = 2
        
        return name
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameOfFilm)
        contentView.addSubview(descriptionFilm)
        contentView.addSubview(filmImageView)
        contentView.backgroundColor = UIColor(named: "swipeMovieWhite")
        
        setupConstrains()
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupImage() {
        filmImageView.contentMode = .scaleAspectFill
        
        filmImageView.clipsToBounds = true
    }
    func setupConstrains() {
        
        [nameOfFilm, descriptionFilm, filmImageView].forEach({element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
        
        NSLayoutConstraint.activate([
            filmImageView.widthAnchor.constraint(equalToConstant: Const.widhtConstImage),
            filmImageView.heightAnchor.constraint(equalToConstant: Const.heightConstImage),
            filmImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.topConst),
            filmImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingConst),
            filmImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Const.bottomConst),
            
            nameOfFilm.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.nameTopConst),
            nameOfFilm.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Const.trailingConst),
            nameOfFilm.leadingAnchor.constraint(equalTo: filmImageView.trailingAnchor, constant: Const.leadingConst),
            
            descriptionFilm.topAnchor.constraint(equalTo: nameOfFilm.bottomAnchor),
            descriptionFilm.leadingAnchor.constraint(equalTo: filmImageView.trailingAnchor, constant: Const.leadingConst),
            descriptionFilm.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Const.trailingConst)
        ])
    }
}
