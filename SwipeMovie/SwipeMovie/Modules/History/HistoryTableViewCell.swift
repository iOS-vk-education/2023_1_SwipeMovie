//
//  HistoryTableViewCell.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 20.11.2023.
//

import UIKit

class MovieCustomCell: UITableViewCell {
    
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let movieNameLabel: UILabel = {
        let movieLabel = UILabel()
        movieLabel.translatesAutoresizingMaskIntoConstraints = false
        movieLabel.font = UIFont.systemFont(ofSize: 16)
        movieLabel.textColor = .gray
        movieLabel.numberOfLines = 0
        return movieLabel
    }()
    
    let lobbyNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    let movieDescriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private let infoButton: UIButton = {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular, scale: .large)
        let infoImage = UIImage(systemName: "info.circle", withConfiguration: imageConfig)
        let infoButton = UIButton()
        infoButton.setImage(infoImage, for: .normal)
        infoButton.addTarget(MovieCustomCell.self, action: #selector(infoButtonDidTapped), for: .allEvents)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        return infoButton
    }()
    
    private let newContentView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.contentView.addSubview(newContentView)
        newContentView.backgroundColor = UIColor(named: "swipeMovieWhite")
        newContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newContentView.topAnchor.constraint(
                equalTo: self.contentView.topAnchor,
                constant: 6),
            newContentView.leadingAnchor.constraint(
                equalTo: self.contentView.leadingAnchor,
                constant: 16),
            newContentView.trailingAnchor.constraint(
                equalTo: self.contentView.trailingAnchor,
                constant: -16),
            newContentView.bottomAnchor.constraint(
                equalTo: self.contentView.bottomAnchor,
                constant: -6)
        ])
        newContentView.layer.cornerRadius = 20
        addMovieImage()
        addInfoButton()
        addLobbyLabel()
        addMovieLabel()
        addDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func infoButtonDidTapped() {
        //
    }
    
    private func addMovieImage() {
        contentView.addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.widthAnchor.constraint(equalToConstant: 58),
            movieImage.heightAnchor.constraint(equalToConstant: 77),
            movieImage.leftAnchor.constraint(
                equalTo: self.newContentView.leftAnchor,
                constant: 20),
            movieImage.topAnchor.constraint(
                equalTo: self.newContentView.topAnchor,
                constant: 14)
        ])
    }
  
    private func addLobbyLabel() {
        contentView.addSubview(lobbyNameLabel)
        NSLayoutConstraint.activate([
            lobbyNameLabel.leftAnchor.constraint(
                equalTo: movieImage.rightAnchor,
                constant: 11),
            lobbyNameLabel.topAnchor.constraint(
                equalTo: self.newContentView.topAnchor,
                constant: 14)
        ])
    }
    
    private func addMovieLabel() {
        contentView.addSubview(movieNameLabel)
        NSLayoutConstraint.activate([
            movieNameLabel.leftAnchor.constraint(
                equalTo: movieImage.rightAnchor,
                constant: 11),
            movieNameLabel.topAnchor.constraint(
                equalTo: lobbyNameLabel.bottomAnchor,
                constant: 10),
            movieNameLabel.rightAnchor.constraint(
                equalTo: infoButton.leftAnchor,
                constant: -5)
        ])
    }
    
    private func addDescriptionLabel() {
        contentView.addSubview(movieDescriptionLabel)
        NSLayoutConstraint.activate([
            movieDescriptionLabel.leftAnchor.constraint(
                equalTo: movieImage.rightAnchor,
                constant: 11),
            movieDescriptionLabel.topAnchor.constraint(
                equalTo: movieNameLabel.bottomAnchor,
                constant: 2),
            movieDescriptionLabel.rightAnchor.constraint(
                equalTo: newContentView.rightAnchor,
                constant: -52)
        ])
    }

    private func addInfoButton() {
        newContentView.addSubview(infoButton)
        NSLayoutConstraint.activate([
            infoButton.centerYAnchor.constraint(equalTo: self.newContentView.centerYAnchor),
            infoButton.rightAnchor.constraint(
                equalTo: self.newContentView.rightAnchor,
                constant: -13)
        ])
    }
}
