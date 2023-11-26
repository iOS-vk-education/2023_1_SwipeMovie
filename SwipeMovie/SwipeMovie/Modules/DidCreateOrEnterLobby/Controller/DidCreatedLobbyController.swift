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
    
    private var didCreatedLobbyView = DidCreatedLobbyView(frame: UIScreen.main.bounds,
                                                          lobbyName: "Название лобби",
                                                          lobbyCode: "123456")
    
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Пожаловаться",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(complaintButtonDidTapped))
        
        didCreatedLobbyView.filmListTableView.delegate = self
        didCreatedLobbyView.filmListTableView.dataSource = self
        didCreatedLobbyView.filmListTableView.register(DidCreateLobbyTableViewCell.self,
                                                                       forCellReuseIdentifier: "cell")
        
        didCreatedLobbyView.bottomButton.addTarget(self,
                                                   action: #selector(startButtonDidTapped),
                                                   for: .touchUpInside)
        
        didCreatedLobbyView.filmListsButton.addTarget(self,
                                                      action: #selector(changeFilmListsButtonDidTapped),
                                                      for: .touchUpInside)
        
        didCreatedLobbyView.guestsListButton.addTarget(self,
                                                       action: #selector(checkAllGuestsButtonDidTapped),
                                                       for: .touchUpInside)
        
        didCreatedLobbyView.topTitleView.codeShareButton.addTarget(self,
                                                                   action: #selector(shareButtonDidTapped),
                                                                   for: .touchUpInside)
    }
    
    // MARK: private methods
    
    // TODO: add full functionality
    
    @objc private func startButtonDidTapped() {
        print("started")
    }
    
    @objc private func checkAllGuestsButtonDidTapped() {
        print("all guests")
    }
    
    @objc private func changeFilmListsButtonDidTapped() {
        print("change")
    }
    
    @objc private func shareButtonDidTapped() {
        print("share")
    }
    
    @objc private func complaintButtonDidTapped() {
        print("complaint")
    }
}

extension DidCreatedLobbyController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tempFilmListNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                       for: indexPath) as? DidCreateLobbyTableViewCell
        else { return UITableViewCell() }
        
        cell.filmListLable.text = tempFilmListNames[indexPath.row]
        cell.checkBoxButton.tag = indexPath.row
        cell.checkBoxButton.addTarget(self, action: #selector(didTappedDeleteCellButton(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func didTappedDeleteCellButton(_ sender: UIButton) {
        tempFilmListNames.remove(at: sender.tag)
        didCreatedLobbyView.filmListTableView.deleteRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        didCreatedLobbyView.filmListTableView.reloadData()
    }
}
