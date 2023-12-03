//
//  DidCreatedLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 10.11.2023.
//

import Foundation
import UIKit

final class DidCreatedLobbyController: UIViewController {
    
    // MARK: properties
    
    // temp data for cells
    var tempFilmListNames = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9", "Test10"]
    
    // MARK: private properties
    
    private var didCreatedLobbyView = DidCreatedLobbyView(frame: UIScreen.main.bounds,
                                                          lobbyName: "Название лобби",
                                                          lobbyCode: "123456")
    
    private var lobbyName = "No name"
    
    private var lobbyCode = "000000"
    
    // MARK: methods
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func loadView() {
        self.view = didCreatedLobbyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor(named: "swipeMovieWhite")
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Пожаловаться",
//                                                            style: .plain,
//                                                            target: self,
//                                                            action: #selector(complaintButtonDidTapped))
        navigationController?.navigationBar.barTintColor = UIColor(named: "swipeMovieBlue")
        
        didCreatedLobbyView.filmListTableView.delegate = self
        didCreatedLobbyView.filmListTableView.dataSource = self
        didCreatedLobbyView.filmListTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        didCreatedLobbyView.filmListTableView.register(TopTitleLobbiesTableViewCell.self,
                                                                       forCellReuseIdentifier: "topTitleCell")
        didCreatedLobbyView.filmListTableView.register(DidCreateLobbyTableViewCell.self,
                                                                       forCellReuseIdentifier: "filmListCell")
        
        didCreatedLobbyView.filmListTableView.estimatedRowHeight = 52
        didCreatedLobbyView.filmListTableView.rowHeight = UITableView.automaticDimension
        
        didCreatedLobbyView.bottomButton.addTarget(self,
                                                   action: #selector(startButtonDidTapped),
                                                   for: .touchUpInside)
        
        didCreatedLobbyView.guestsListButton.addTarget(self,
                                                       action: #selector(checkAllGuestsButtonDidTapped),
                                                       for: .touchUpInside)
    }
    
    func setTitleLabelText(text: String, code: String) {
        lobbyName = text
        lobbyCode = code
    }
    
    // MARK: private methods
    
    // TODO: add full functionality
    
    @objc private func startButtonDidTapped() {
        print("started")
    }
    
    @objc private func checkAllGuestsButtonDidTapped() {
        print("all guests")
        let controller = UIViewController()
        present(controller, animated: true, completion: nil)
    }
    
    @objc private func changeFilmListsButtonDidTapped() {
        print("change")
        tempFilmListNames.append(String(Int.random(in: 10..<100)))
        didCreatedLobbyView.filmListTableView.beginUpdates()
        didCreatedLobbyView.filmListTableView.insertRows(at: [IndexPath.init(row: tempFilmListNames.count - 1,
                                                                             section: 1)],
                                                         with: .automatic)
        didCreatedLobbyView.filmListTableView.endUpdates()
    }
    
    @objc private func shareButtonDidTapped() {
        print("share")
    }
    
    @objc private func complaintButtonDidTapped() {
        print("complaint")
    }
}

extension DidCreatedLobbyController: UITableViewDataSource, UITableViewDelegate {
    
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
                                                           for: indexPath) as? DidCreateLobbyTableViewCell
            else { return UITableViewCell() }
            
            cell.filmListLable.text = tempFilmListNames[indexPath.row]
            cell.checkBoxButton.tag = indexPath.row
            cell.checkBoxButton.addTarget(self,
                                          action: #selector(didTappedDeleteCellButton(_:)),
                                          for: .touchUpInside)
            
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
            cell.filmListsButton.addTarget(self,
                                           action: #selector(changeFilmListsButtonDidTapped),
                                           for: .touchUpInside)
            
            return cell
        }
    }
    
    @objc func didTappedDeleteCellButton(_ sender: UIButton) {
        tempFilmListNames.remove(at: sender.tag)
        didCreatedLobbyView.filmListTableView.deleteRows(at: [IndexPath(row: sender.tag, section: 1)], with: .fade)
        didCreatedLobbyView.filmListTableView.reloadData()
    }
}
