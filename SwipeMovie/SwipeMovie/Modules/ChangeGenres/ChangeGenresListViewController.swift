//
//  ChangeGenresListViewController.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 16.11.2023.
//

import UIKit

class ChangeGenresListViewController: UIViewController {
    // MARK: - Private
    private let contentView = ChangeGenresView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpView()
    }
    private func setUpNavigationBar() {
        navigationItem.title = "Списки фильмов"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor(named: "swipeMovieWhite")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "swipeMovieBlue")
    }
    private func setUpView() {
        view = contentView
        contentView.onCellTap = { [weak self] index in
            let cell = self?.contentView.filmListCollectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? ChangeGenresCollectionCell
            let filmListViewController = FilmListViewController()
            filmListViewController.filmsListId = cell?.idOfFilmList ?? ""
            self?.navigationController?.pushViewController(filmListViewController, animated: true)
        }
    }
}
