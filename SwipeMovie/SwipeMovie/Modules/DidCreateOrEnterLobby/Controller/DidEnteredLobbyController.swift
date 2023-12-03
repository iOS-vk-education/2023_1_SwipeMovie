//
//  DidEnteredLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 10.11.2023.
//

import Foundation
import UIKit

final class DidEnteredLobbyController: UIViewController {
    
    // MARK: properties
    
    // temp data for cells
    var tempFilmListNames = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9", "Test10"]
    
    // MARK: private properties
    
    private var didEnteredLobbyView = DidEnteredLobbyView(frame: UIScreen.main.bounds,
                                                          lobbyName: "Название лобби",
                                                          lobbyCode: "123456")
    
    private var lobbyName = "No name"
    
    private var lobbyCode = "000000"
    
    // MARK: methods
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func loadView() {
        self.view = didEnteredLobbyView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor(named: "swipeMovieWhite")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Пожаловаться",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(complaintButtonDidTapped))
        navigationController?.navigationBar.barTintColor = UIColor(named: "swipeMovieBlue")
        
        didEnteredLobbyView.filmListTableView.delegate = self
        didEnteredLobbyView.filmListTableView.dataSource = self
        didEnteredLobbyView.filmListTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        didEnteredLobbyView.filmListTableView.register(TopTitleLobbiesTableViewCell.self,
                                                                       forCellReuseIdentifier: "topTitleCell")
        didEnteredLobbyView.filmListTableView.register(DidEnterLobbyTableViewCell.self,
                                                       forCellReuseIdentifier: "filmListCell")
        didEnteredLobbyView.filmListTableView.estimatedRowHeight = 52
        didEnteredLobbyView.filmListTableView.rowHeight = UITableView.automaticDimension
        
        didEnteredLobbyView.bottomButton.addTarget(self,
                                                   action: #selector(startButtonDidTapped),
                                                   for: .touchUpInside)
    }
    
    func setTitleLabelText(text: String, code: String) {
        lobbyName = text
        lobbyCode = code
    }
    
    // MARK: private methods
    
    // TODO: add full functionality
    
    @objc private func startButtonDidTapped() {
        print("ready")
    }
    
    @objc private func complaintButtonDidTapped() {
        print("complaint")
    }
    
    @objc private func shareButtonDidTapped() {
        print("share")
    }
}

extension DidEnteredLobbyController: UITableViewDataSource, UITableViewDelegate {
    
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
        else { return UITableViewCell() }
        
        cell.filmListLable.text = tempFilmListNames[indexPath.row]
        
        return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "topTitleCell",
                                                           for: indexPath) as? TopTitleLobbiesTableViewCell
            else { return UITableViewCell() }
            
            cell.titleLabel.setText(text: lobbyName)
            cell.codeLabel.setText(text: lobbyCode)
            cell.codeShareButton.addTarget(self,
                                           action: #selector(shareButtonDidTapped),
                                           for: .touchUpInside)
            cell.filmListsButton.isHidden = true
            cell.filmListsButton.isEnabled = false
            
            return cell
        }
    }

}
