//
//  FilmsGenreViewController.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 22.11.2023.
//

import UIKit

final class FilmsGenreViewController: UIViewController {
    // MARK: - Private
    private let contentView = FilmsGenreView()
    
    private let service: FileGenresService
    private var response: [FilmGenreResponse] = []
    
    // MARK: - Init
    init(service: FileGenresService) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        setUpView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        loadGenres()
    }
    
    private func setUpView() {
        contentView.onCellTap = { [weak self] index in
            guard let self, index < self.response.count else { return }
            
            let genre = self.response[index].name
            
            let viewController = FilmListViewController(genre: genre, service: FilmListServiceImpl())
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func loadGenres() {
        service.loadGenres { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    let viewData = value.map { element in
                        InfoCellModelGenre(name: element.name.capitalized, description: "Здесь собраны фильмы по данному жанру")
                    }
                    self?.contentView.setData(viewData)
                    self?.response = value
                    
                case .failure:
                    break
                }
            }
        }
    }
    
    private func setUpNavigationBar() {
        navigationItem.title = "Списки фильмов"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "swipeMovieBlue")
    }
}
