//
//  MoviePageViewController.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 08.12.2023.
//

import UIKit

final class MoviePageViewController: UIViewController {
    
    private var createMoviePageView = MoviePageView(frame: UIScreen.main.bounds)
    
    private var isFavoriteButtonTapped = false
    
    override func loadView() {
        super.loadView()
        self.view = createMoviePageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMoviePageView.configureMoviePageView(
            movieTitle: "Monsters Inc",
            movieImageName: "AppIcon",
            imdbRating: "9.5/10",
            movieDescription: "Description")
        setUpFavoriteButtonTarget()
    }
    
    private func setUpFavoriteButtonTarget() {
        createMoviePageView.favoriteButton.addTarget(
            self,
            action: #selector(didTapFavoriteButton),
            for: .touchUpInside)
    }
    
    @objc
    private func didTapFavoriteButton() {
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .regular)
        if isFavoriteButtonTapped {
            let image = UIImage(systemName: "star", withConfiguration: config)
            createMoviePageView.favoriteButton.setImage(image, for: .normal)
            isFavoriteButtonTapped = false
        } else {
            let image = UIImage(systemName: "star.fill", withConfiguration: config)
            createMoviePageView.favoriteButton.setImage(image, for: .normal)
            isFavoriteButtonTapped = true
        }
    }
    
}
