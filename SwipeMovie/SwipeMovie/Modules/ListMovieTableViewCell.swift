//
//  ListMovieTableViewCell.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 03.12.2023.
//

import UIKit

final class ListMovieTableViewCell: MovieTableViewCell {
    
    private lazy var movieDescriptionLabel = configureLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureListCell(imageName: String, title: String, description: String) {
        if let img = UIImage(named: imageName) {
            movieImage.image = img
        }
        titleLabel.text = title
        movieDescriptionLabel.text = description
    }

    private func setUpDescription() {
        contentView.addSubview(movieDescriptionLabel)
        NSLayoutConstraint.activate([
            movieDescriptionLabel.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: 11),
            movieDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            movieDescriptionLabel.rightAnchor.constraint(equalTo: newContentView.rightAnchor, constant: -50),
            movieDescriptionLabel.bottomAnchor.constraint(equalTo: movieImage.bottomAnchor)
        ])
    }
}
