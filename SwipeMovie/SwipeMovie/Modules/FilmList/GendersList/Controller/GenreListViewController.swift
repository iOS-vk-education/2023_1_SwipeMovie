//
//  GenreListViewController.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 16.11.2023.
//

import UIKit

class GenreListViewController: UIViewController {
    // MARK: - Private
    private var contentView = FilmsGenreView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.filmListsKeysArr = Array(FilmsListManager.shared.allFilmsListDictionary.keys)
        contentView.filmListCollectionView.reloadData()
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
            let cell = self?.contentView.filmListCollectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? GenreListCollectionViewCell
            let filmListViewController = FilmListViewController()
            filmListViewController.filmsListId = cell?.idOfFilmList ?? ""
            self?.navigationController?.pushViewController(filmListViewController, animated: true)
        }
    }
}
