//
//  MoviePage.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 08.12.2023.
//

import UIKit

final class MoviePageView: UIView {
    
    let favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .regular)
        let image = UIImage(systemName: "star", withConfiguration: config)
        favoriteButton.setImage(image, for: .normal)
        favoriteButton.tintColor = UIColor(named: "swipeMovieBlue")
        return favoriteButton
    }()
    
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
        return label
    }()
    
    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let imdbLabel: UILabel = {
        let imdbLabel = UILabel()
        imdbLabel.translatesAutoresizingMaskIntoConstraints = false
        imdbLabel.font = UIFont.preferredFont(forTextStyle: .body)
        imdbLabel.numberOfLines = 1
        imdbLabel.textColor = .black
        return imdbLabel
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
        return descriptionLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "swipeMovieBlue")
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureMoviePageView(movieTitle: String, movieImageName: String, imdbRating: String, movieDescription: String) {
        titleLabel.text = movieTitle
        movieImage.image = UIImage(named: movieImageName)
        imdbLabel.text = "\(imdbRating) IMDb"
        descriptionLabel.text = movieDescription
    }
    
    private func configureView() {
        setUpScrollView()
        setUpContentView()
        setUpTitleLabel()
        setUpMovieImage()
        setUpFavoriteButton()
        setUpIMDbLabel()
        setUpDescriptionTitleLabel()
        setUpDescriptionLabel()
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
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
}
