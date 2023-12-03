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
        configureRightBarButton()
        
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
    }
    
    @objc
    func changeButtonDidTapped() {
        //
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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Изменить",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(changeButtonDidTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "swipeMovieWhite")
    }
}

// MARK: - TableViewDelegate and TableViewDataSource
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "MovieCell", for: indexPath) as?  HistoryMovieTableViewCell else {
            return HistoryMovieTableViewCell()
        }
        
        cell.selectionStyle = .none
        // test
        cell.titleLabel.text = "Lobby Name"
        cell.movieNameLabel.text = "Movie Name"
        cell.movieDescriptionLabel.text = "Movie Description"
        cell.movieImage.image = UIImage(named: "AppIcon")
        //
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
}

// MARK: - SearchBarDelegate
extension HistoryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
    }
}
