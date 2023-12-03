//
//  HistoryTableViewCell.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 20.11.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        nameLabel.textColor = UIColor(named: "swipeMovieBlack")
        nameLabel.numberOfLines = 1
        return nameLabel
    }()
    
    let newContentView = UIView()
    
    var infoButton: UIButton = {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular, scale: .large)
        let infoImage = UIImage(systemName: "info.circle", withConfiguration: imageConfig)
        var infoButton = UIButton()
        infoButton.setImage(infoImage, for: .normal)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        return infoButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.contentView.addSubview(newContentView)
        newContentView.backgroundColor = UIColor(named: "swipeMovieWhite")
        newContentView.translatesAutoresizingMaskIntoConstraints = false
        newContentView.layer.cornerRadius = 20
        
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
        
        addMovieImage()
        addInfoButton()
        addTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addMovieImage() {
        contentView.addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.widthAnchor.constraint(equalToConstant: 58),
            movieImage.heightAnchor.constraint(equalToConstant: 77),
            movieImage.leftAnchor.constraint(
                equalTo: self.newContentView.leftAnchor,
                constant: 14),
            movieImage.topAnchor.constraint(
                equalTo: self.newContentView.topAnchor,
                constant: 14)
        ])
    }
  
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(
                equalTo: movieImage.rightAnchor,
                constant: 11),
            titleLabel.topAnchor.constraint(
                equalTo: self.newContentView.topAnchor,
                constant: 14),
            titleLabel.rightAnchor.constraint(equalTo: newContentView.rightAnchor, constant: -50),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
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
