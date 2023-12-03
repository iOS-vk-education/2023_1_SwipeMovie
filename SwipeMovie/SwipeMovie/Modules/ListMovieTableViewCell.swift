//
//  ListMovieTableViewCell.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 03.12.2023.
//

import UIKit

final class ListMovieTableViewCell: MovieTableViewCell {
    
    let movieDescriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        return descriptionLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
