//
//  DidEnterLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 10.11.2023.
//

import Foundation
import UIKit

final class DidEnterLobbyController: UIViewController {
    
    // MARK: properties
    
    // temp data for cells
    private var tempFilmListNames = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9", "Test10"]
    
    // MARK: private properties
    
    private var didEnterLobbyView = DidEnteredLobbyView(frame: UIScreen.main.bounds,
                                                          lobbyName: "Название лобби",
                                                          lobbyCode: "123456")
    
    private var lobbyName = "No name"
    
    private var lobbyCode = "000000"
    
    // MARK: methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = didEnterLobbyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        configureTable()
        configureButtonFunctionality()
    }
    
    func setTitleLabelText(text: String, code: String) {
        lobbyName = text
        lobbyCode = code
    }
    
    // MARK: private methods
    
    private func configureNavigation() {
        
        navigationController?.navigationBar.tintColor = UIColor(named: "swipeMovieWhite")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Пожаловаться",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(complaintButtonDidTapped))
        navigationController?.navigationBar.barTintColor = UIColor(named: "swipeMovieBlue")
    }
    
    private func configureTable() {
        
        didEnterLobbyView.filmListTableView.allowsSelection = false
        didEnterLobbyView.filmListTableView.delegate = self
        didEnterLobbyView.filmListTableView.dataSource = self
        didEnterLobbyView.filmListTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        didEnterLobbyView.filmListTableView.register(TopTitleLobbiesTableViewCell.self,
                                                     forCellReuseIdentifier: "topTitleCell")
        didEnterLobbyView.filmListTableView.register(DidEnterLobbyTableViewCell.self,
                                                     forCellReuseIdentifier: "filmListCell")
        didEnterLobbyView.filmListTableView.estimatedRowHeight = 52
        didEnterLobbyView.filmListTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func configureButtonFunctionality() {
        
        didEnterLobbyView.bottomButton.addTarget(self,
                                                 action: #selector(startButtonDidTapped),
                                                 for: .touchUpInside)
    }
    
    // TODO: add full functionality
    
    @objc private func startButtonDidTapped() {
        print("ready")
        
        let alert = UIAlertController(title: "Пожалуйста, подождите, пока все участники будут готовы.", message: "\n \n", preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(frame: alert.view.bounds)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -20),
            indicator.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor)
        ])
        
        indicator.isUserInteractionEnabled = false
        indicator.startAnimating()
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func complaintButtonDidTapped() {
        print("complaint")
    }
    
    @objc private func shareButtonDidTapped() {
        print("share")
    }
}

extension DidEnterLobbyController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1 {
            return tempFilmListNames.count
            
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "filmListCell",
                                                       for: indexPath) as? DidEnterLobbyTableViewCell
        else { return DidEnterLobbyTableViewCell() }
        
        cell.configure(text: tempFilmListNames[indexPath.row])
            
        return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "topTitleCell",
                                                           for: indexPath) as? TopTitleLobbiesTableViewCell
            else { return UITableViewCell() }
            
            cell.configure(titleText: lobbyName, code: lobbyCode, type: .enter)
            cell.codeShareButton.addTarget(self,
                                           action: #selector(shareButtonDidTapped),
                                           for: .touchUpInside)
            
            return cell
        }
    }

}
