//
//  HistoryMovieTableViewCell.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 03.12.2023.
//

import UIKit

final class HistoryMovieTableViewCell: MovieTableViewCell {
    
    let movieNameLabel: UILabel = {
        let movieLabel = UILabel()
        movieLabel.translatesAutoresizingMaskIntoConstraints = false
        movieLabel.font = UIFont.systemFont(ofSize: 14)
        movieLabel.textColor = .gray
        movieLabel.numberOfLines = 0
        return movieLabel
    }()
    
    let movieDescriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addMovieLabel()
        addDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addMovieLabel() {
        contentView.addSubview(movieNameLabel)
        NSLayoutConstraint.activate([
            movieNameLabel.leftAnchor.constraint(
                equalTo: movieImage.rightAnchor,
                constant: 11),
            movieNameLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 10),
            movieNameLabel.rightAnchor.constraint(
                equalTo: newContentView.rightAnchor, constant: -50)
        ])
    }
    
    private func addDescriptionLabel() {
        contentView.addSubview(movieDescriptionLabel)
        NSLayoutConstraint.activate([
            movieDescriptionLabel.leftAnchor.constraint(
                equalTo: movieNameLabel.leftAnchor),
            movieDescriptionLabel.topAnchor.constraint(
                equalTo: movieNameLabel.bottomAnchor),
            movieDescriptionLabel.rightAnchor.constraint(
                equalTo: movieNameLabel.rightAnchor),
            movieDescriptionLabel.bottomAnchor.constraint(equalTo: movieImage.bottomAnchor)
        ])
    }
}
