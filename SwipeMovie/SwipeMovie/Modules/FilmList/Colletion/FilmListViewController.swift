//
//  FilmListViewController.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 16.11.2023.
//

import UIKit

final class FilmListViewController: UIViewController {
    
    private let scroll = UIScrollView()
    private let contentView = FilmListView()
    private let service: FilmListService
    private let genre: String
    
    // MARK: - Init
    init(genre: String, service: FilmListService) {
        self.genre = genre
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Списки фильмов"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "swipeMovieBlue")

        
        service.loadFilms(genre: genre) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    let viewData = value.docs.map { element in
                        InfoCellModel(
                            name: element.name,
                            description: element.description,
                            previewUrl: element.poster.previewUrl
                        )
                    }
                    self?.contentView.setData(viewData)
                    
                case .failure:
                    // TODO: Alert
                    break
                }
            }
        }
    }
}
