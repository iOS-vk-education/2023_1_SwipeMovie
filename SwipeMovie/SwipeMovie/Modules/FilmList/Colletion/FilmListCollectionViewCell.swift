//
//  FilmListCollectionViewCell.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 19.11.2023.
//

import UIKit
import Kingfisher

struct InfoCellModel {
    let name: String
    let description: String
    let previewUrl: URL?
}

final class FilmListCollectionViewCell: UICollectionViewCell {
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
    
    private let filmImageView = UIImageView()
    
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
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameOfGenre)
        contentView.addSubview(descriptionOfGenre)
        contentView.addSubview(filmImageView)
        contentView.backgroundColor = UIColor(named: "swipeMovieCollectionViewCell")
        
        setupConstrains()
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupImage(){
        filmImageView.contentMode = .scaleAspectFill
        filmImageView.clipsToBounds = true
       // filmImageView.layer.cornerRadius = Const.cornerRadius
    }
}
// MARK: - layout
private extension FilmListCollectionViewCell {
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

extension FilmListCollectionViewCell {
    func updateInfo(with info: InfoCellModel) {
        nameOfGenre.text = info.name
        descriptionOfGenre.text = info.description
        if let previewUrl = info.previewUrl {
            filmImageView.kf.setImage(with: .network(previewUrl))
        }
    }
}
