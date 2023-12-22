//
//  MoviePageViewController.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 08.12.2023.
//

import UIKit
import CoreData

final class MoviePageViewController: UIViewController {
    
    var createMoviePageView = MoviePageView(frame: UIScreen.main.bounds)
    
    lazy var moviePageData = createMoviePageView.fetchViewData()
    
    lazy var movieData = FavoriteMovies(context: self.context)
    
    // Reference to managed object context
    // swiftlint:disable force_cast
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // swiftlint:enable force_cast
    
    private var isFavoriteButtonTapped = false
    
    override func loadView() {
        super.loadView()
        self.view = createMoviePageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            
            // create a movie object
            let newMovie = FavoriteMovies(context: self.context)
            newMovie.movieName = moviePageData.movieName
            newMovie.movieDescription = moviePageData.movieDescription
            newMovie.imdbRating = moviePageData.imdbRating
            newMovie.movieImage = moviePageData.movieImage.pngData()
            
            // safe the data
            do {
                try self.context.save()
            } catch {
            }

            isFavoriteButtonTapped = false
        } else {
            let image = UIImage(systemName: "star.fill", withConfiguration: config)
            createMoviePageView.favoriteButton.setImage(image, for: .normal)
            
            // delete the data
            do {
                try self.context.delete(<#T##object: NSManagedObject##NSManagedObject#>)
            } catch {
                
            }
            isFavoriteButtonTapped = true
        }
    }
    
}
