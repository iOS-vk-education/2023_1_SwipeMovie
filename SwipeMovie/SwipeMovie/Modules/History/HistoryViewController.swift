//
//  HistoryViewController.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 16.11.2023.
//

import UIKit

class HistoryViewController: UIViewController {
    
    let historyTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // properties for searchBar
    private var lobbyData: [(String, Film)] = []
    
    private var isSearching = false
    
    private var searchedLobbies: [(String, Film)] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private var resultsKeys = Array(LobbyResultManager.shared.resultsDictionary.keys)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyTableView.reloadData()
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Поиск",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        historyTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsKeys = Array(LobbyResultManager.shared.resultsDictionary.keys)
        
        // for searchBar
        lobbyData = LobbyResultManager.shared.lobbyData
        
//        configureLeftBarLabel()
//        configureRightBarButton()
        
        self.view.addSubview(historyTableView)
        
        setUpNavigationBar()

        view.backgroundColor = UIColor(named: "swipeMovieBlue")

        
        historyTableView.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        // fix white space in top of tableview while scrolling
//        historyTableView.bounces = false
        
        // fix empty space in the table view bottom
//        let footerView = UIView()
//        footerView.frame.size.height = 0
//        historyTableView.tableFooterView = footerView
        let vvv = UIView()
        vvv.backgroundColor = UIColor(named: "swipeMovieBlue")
        historyTableView.backgroundView = vvv
        
        historyTableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.backgroundColor = UIColor(named: "swipeMovieBlue")
        searchController.searchBar.setValue("Отменить", forKey: "cancelButtonText")
        
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
        
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "swipeMovieWhite")
    }
    
//    @objc
//    func didTapChangeButton() {
//        //
//    }
    
    @objc
    func didTapInfoButton(_ sender: UIButton) {
        
        let controller = MoviePageViewController()
        
        var movieViewData: (String, Film)
        
        if isSearching {
            movieViewData = searchedLobbies[sender.tag]
            controller.createMoviePageView.configureMoviePageView(
                imageURL: movieViewData.1.imageURL,
                movieName: movieViewData.1.name,
                description: movieViewData.1.description)
        } else {
            controller.createMoviePageView.configureMoviePageView(
                imageURL: LobbyResultManager.shared.resultsDictionary[resultsKeys[sender.tag]]?.1.imageURL ?? "https://firebasestorage.googleapis.com/v0/b/swipemovie-53353.appspot.com/o/IMG_1010.PNG?alt=media&token=2d4b188e-db49-494a-98b7-cffeb71ef2df",
                movieName: LobbyResultManager.shared.resultsDictionary[resultsKeys[sender.tag]]?.1.name ?? "",
                description: LobbyResultManager.shared.resultsDictionary[resultsKeys[sender.tag]]?.1.description ?? "")
        }
                
//        navigationController?.pushViewController(controller, animated: true)
        present(controller, animated: true)
    }
    
    private func setUpNavigationBar() {
        navigationItem.title = "История"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "swipeMovieBlue")
    }
    
    private func configureSearchBar() {
        searchController.searchBar.sizeToFit()
        searchController.searchBar.isTranslucent = true
        searchController.searchBar.barTintColor = UIColor(named: "swipeMovieBlue")
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.tintColor = .white
    }
    
//    private func configureLeftBarLabel() {
//        let label = UILabel()
//        label.textColor = UIColor.white
//        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
//        label.text = "История"
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
//    }
//
//    private func configureRightBarButton() {
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Изменить",
//                                                                 style: .plain,
//                                                                 target: self,
//                                                                 action: #selector(didTapChangeButton))
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "swipeMovieWhite")
//    }
}

// MARK: - TableViewDelegate and TableViewDataSource
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchedLobbies.count
        } else {
            return resultsKeys.count
        }
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
        
        // test
        if isSearching {
            cell.configureHistoryCell(imageURL: searchedLobbies[indexPath.row].1.imageURL,
                                      lobbyName: searchedLobbies[indexPath.row].0,
                                      movieName: searchedLobbies[indexPath.row].1.name,
                                      description: searchedLobbies[indexPath.row].1.description)
        } else {
            cell.configureHistoryCell(
                imageURL: LobbyResultManager.shared.resultsDictionary[resultsKeys[indexPath.row]]?.1.imageURL ?? "https://firebasestorage.googleapis.com/v0/b/swipemovie-53353.appspot.com/o/IMG_1010.PNG?alt=media&token=2d4b188e-db49-494a-98b7-cffeb71ef2df",
                lobbyName: LobbyResultManager.shared.resultsDictionary[resultsKeys[indexPath.row]]?.0 ?? "",
                movieName: LobbyResultManager.shared.resultsDictionary[resultsKeys[indexPath.row]]?.1.name ?? "",
                description: "")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
}

// MARK: - SearchBarDelegate
extension HistoryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedLobbies = lobbyData.filter({$0.0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        isSearching = true
        historyTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        historyTableView.reloadData()
    }
}
