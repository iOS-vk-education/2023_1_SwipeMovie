//
//  GenreListViewController.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 16.11.2023.
//

import UIKit

class GenreListViewController: UIViewController {
    // MARK: - Private
    private let contentView = FilmsGenreView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpView()
    }
    private func setUpNavigationBar() {
        navigationItem.title = "Списки жанров"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "swipeMovieBlue")
    }
    private func setUpView() {
        view = contentView
        contentView.onCellTap = { [weak self] index in
            let filmListViewController = FilmListViewController()
            self?.navigationController?.pushViewController(filmListViewController, animated: true)
        }
    }
}
