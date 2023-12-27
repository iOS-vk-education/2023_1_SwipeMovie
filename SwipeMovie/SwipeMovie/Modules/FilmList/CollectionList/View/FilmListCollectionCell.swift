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
    
    private var filmImageView = UIImageView()
    
    private var nameOfGenre: UILabel = {
        let name = UILabel()
        
        name.font = UIFont.systemFont(ofSize: 17)
        
        name.textColor = .black
        
        return name
    }()
    private var descriptionOfGenre: UILabel = {
        let name = UILabel()
        
        name.font = UIFont.systemFont(ofSize: 15)
        
        name.textColor = .gray
        
        name.numberOfLines = 2
        
        return name
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameOfGenre)
        contentView.addSubview(descriptionOfGenre)
        contentView.addSubview(filmImageView)
        contentView.backgroundColor = UIColor(named: "swipeMovieWhite")
        
        setupConstrains()
        setupImage()
    }
    
    func configureCell(name: String, description: String, imageUrl: String) {
        filmImageView.load(url: URL(string: imageUrl) ?? URL(string: "https://firebasestorage.googleapis.com/v0/b/swipemovie-53353.appspot.com/o/IMG_1010.PNG?alt=media&token=2d4b188e-db49-494a-98b7-cffeb71ef2df")! )
        descriptionOfGenre.text = description
        nameOfGenre.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupImage() {
        filmImageView.contentMode = .scaleAspectFill
        
        filmImageView.clipsToBounds = true
    }
    func setupConstrains() {
        
        [nameOfGenre, descriptionOfGenre, filmImageView].forEach({element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
        
        NSLayoutConstraint.activate([
            filmImageView.widthAnchor.constraint(equalToConstant: Const.widhtConstImage),
            filmImageView.heightAnchor.constraint(equalToConstant: Const.heightConstImage),
            filmImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.topConst),
            filmImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingConst),
            filmImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Const.bottomConst),
            
            nameOfGenre.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.nameTopConst),
            nameOfGenre.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Const.trailingConst),
            nameOfGenre.leadingAnchor.constraint(equalTo: filmImageView.trailingAnchor, constant: Const.leadingConst),
            
            descriptionOfGenre.topAnchor.constraint(equalTo: nameOfGenre.bottomAnchor),
            descriptionOfGenre.leadingAnchor.constraint(equalTo: filmImageView.trailingAnchor, constant: Const.leadingConst),
            descriptionOfGenre.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Const.trailingConst)
        ])
    }
}
