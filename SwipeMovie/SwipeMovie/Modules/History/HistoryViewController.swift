//
//  HistoryViewController.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 16.11.2023.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {
    
    // Data for the History Table
    var historyItems: [HistoryData] = []
    
    // Reference to managed object context
    // swiftlint:disable force_cast
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // swiftlint:enable force_cast
    
    let historyTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Поиск",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLeftBarLabel()
        
        self.view.addSubview(historyTableView)
        
        historyTableView.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        // fix white space in top of tableview while scrolling
        historyTableView.bounces = false
        
        // fix empty space in the table view bottom
        let footerView = UIView()
        footerView.frame.size.height = 0
        historyTableView.tableFooterView = footerView
        
        historyTableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        // constrain the table view
        NSLayoutConstraint.activate([
            historyTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            historyTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            historyTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            historyTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        // set tableview delegate and data source
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
        // register custom cell
        historyTableView.register(HistoryMovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
        
        // set search bar delegate
        searchController.searchBar.delegate = self
        
        // configure search bar
        configureSearchBar()
        
        // Get items from CoreData
        fetchLobbyData()
    }
    
    func fetchLobbyData() {
        // fetch the data from CoreData to display in the tableview
        do {
            self.historyItems =  try context.fetch(HistoryData.fetchRequest())
            
            DispatchQueue.main.async {
                self.historyTableView.reloadData()
            }
        } catch {
        }
    }
    
    @objc
    func didTapChangeButton() {
        //
    }
    
    @objc
    func didTapInfoButton(_ sender: UIButton) {
        
        let movieViewData = historyItems[sender.tag]
        
        let controller = MoviePageViewController()
        
        if let imageData = movieViewData.movieImage {
            if let image = UIImage(data: imageData) {
                controller.createMoviePageView.configureMoviePageView(
                    movieTitle: movieViewData.movieName ?? "",
                    image: image,
                    imdbRating: movieViewData.imdbRating ?? "",
                    movieDescription: movieViewData.movieDescription ?? "")
            }
        }

        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func configureSearchBar() {
        searchController.searchBar.sizeToFit()
        searchController.searchBar.isTranslucent = true
        searchController.searchBar.barTintColor = UIColor(named: "swipeMovieBlue")
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.tintColor = .white
    }
    
    private func configureLeftBarLabel() {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.text = "История"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    private func configureRightBarButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Изменить",
            style: .plain,
            target: self,
            action: #selector(didTapChangeButton))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "swipeMovieWhite")
    }
}

// MARK: - TableViewDelegate and TableViewDataSource
extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "MovieCell", for: indexPath) as?  HistoryMovieTableViewCell else {
            return HistoryMovieTableViewCell()
        }
        
        cell.selectionStyle = .none
        
        cell.infoButton.addTarget(
            self,
            action: #selector(didTapInfoButton(_:)),
            for: .touchUpInside)
        
        cell.infoButton.tag = indexPath.row
        
        let historyLobby = historyItems[indexPath.row]
        
        if let imageData = historyLobby.movieImage {
            if let movieImage = UIImage(data: imageData) {
                cell.configureHistoryCell(
                    image: movieImage,
                    lobbyName: historyLobby.lobbyName ?? "",
                    movieName: historyLobby.movieName ?? "",
                    description: historyLobby.movieDescription ?? "")
            }
        }
        return cell
    }
}

// MARK: - UITableViewDataSource
extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    // delete cell
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
         return "Удалить"
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let lobbyToRemove = historyItems[indexPath.row]
            self.context.delete(lobbyToRemove)
            do {
                try self.context.save()
            } catch {
            }
            self.fetchLobbyData()
        }
    }
}

// MARK: - SearchBarDelegate
extension HistoryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
    }
}
