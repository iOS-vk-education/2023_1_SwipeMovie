//
//  MoviePage.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 08.12.2023.
//

import UIKit

class MoviePageView: UIView {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(named: "swipeMovieWhite")
        scrollView.layer.cornerRadius = 40
        scrollView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor(named: "swipeMovieBlack")
        label.text = "Monsters inc"
        return label
    }()
    
    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "ImageFilm")
        return imageView
    }()
    
    private let imdbLabel: UILabel = {
        let imdbLabel = UILabel()
        imdbLabel.translatesAutoresizingMaskIntoConstraints = false
        imdbLabel.font = UIFont.preferredFont(forTextStyle: .body)
        imdbLabel.numberOfLines = 1
        imdbLabel.textColor = .black
        imdbLabel.text = "9.5/10 IMDb"
        return imdbLabel
    }()
    
    private let favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .regular)
        let image = UIImage(systemName: "star", withConfiguration: config)
        favoriteButton.setImage(image, for: .normal)
        favoriteButton.tintColor = UIColor(named: "swipeMovieBlue")
        return favoriteButton
        
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.textColor = UIColor(named: "swipeMovieBlue")
        titleLabel.text = "Описание"
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.textColor = .black
        // swiftlint: disable line_length
        descriptionLabel.text = """
Склизкий гад в сливном бачке, мохнатый зверь, похожий на чудовище из «Аленького цветочка», гигантские мокрицы под кроватью — все они существуют на самом деле.

Полнометражный мультфильм рассказывает о кризисах в мире монстров, их жизни. Но однажды вся мирная жизнь монстров оказывается под угрозой: в их мир попадает ребенок. А с детьми столько хлопот, что они могут довести даже монстров.
"""
        // swiftlint: enable line_length
        return descriptionLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        setUpScrollView()
        setUpContentView()
        setUpTitleLabel()
        setUpMovieImage()
        setUpFavoriteButton()
        setUpIMDbLabel()
        setUpDescriptionTitleLabel()
        setUpDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpScrollView() {
        self.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpContentView() {
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setUpTitleLabel() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30)
        ])
    }
    
    private func setUpMovieImage() {
        contentView.addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            movieImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30),
            movieImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            movieImage.heightAnchor.constraint(equalToConstant: (frame.width - 60) * 9 / 16)
        ])
    }
    
    private func setUpFavoriteButton() {
        contentView.addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 20),
            favoriteButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30)
        ])
    }
    
    private func setUpIMDbLabel() {
        contentView.addSubview(imdbLabel)
        NSLayoutConstraint.activate([
            imdbLabel.centerYAnchor.constraint(equalTo: favoriteButton.centerYAnchor),
            imdbLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30)
        ])
    }
    
    private func setUpDescriptionTitleLabel() {
        contentView.addSubview(descriptionTitleLabel)
        NSLayoutConstraint.activate([
            descriptionTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            descriptionTitleLabel.topAnchor.constraint(equalTo: imdbLabel.bottomAnchor, constant: 17)
        ])
    }
    
    private func setUpDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
}
