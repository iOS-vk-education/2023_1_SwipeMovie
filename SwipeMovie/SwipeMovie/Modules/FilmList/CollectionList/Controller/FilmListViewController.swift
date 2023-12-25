//
//  FilmListViewController.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 24.12.2023.
//

import UIKit

class FilmListViewController: UIViewController {
    
    private let contentView = FilmListView()
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }
    private func setUpNavigationBar() {
        navigationItem.title = "Списки фильмов"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "swipeMovieBlue")
    }
}
