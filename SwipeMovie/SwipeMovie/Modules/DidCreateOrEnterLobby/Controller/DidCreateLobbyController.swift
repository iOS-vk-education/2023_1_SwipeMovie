//
//  DidCreateLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 10.11.2023.
//

import Foundation
import UIKit

final class DidCreateLobbyController: UIViewController {
    
    // MARK: properties
    
    // temp data for cells
    private var tempFilmListNames = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9", "Test10"]
    
    // MARK: private properties
    
    private var didCreateLobbyView = DidCreatedLobbyView(frame: UIScreen.main.bounds,
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
        
        self.view = didCreateLobbyView
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
        navigationController?.navigationBar.barTintColor = UIColor(named: "swipeMovieBlue")
    }
    
    private func configureTable() {
        
        didCreateLobbyView.filmListTableView.allowsSelection = false
        didCreateLobbyView.filmListTableView.delegate = self
        didCreateLobbyView.filmListTableView.dataSource = self
        didCreateLobbyView.filmListTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        didCreateLobbyView.filmListTableView.register(TopTitleLobbiesTableViewCell.self,
                                                      forCellReuseIdentifier: "topTitleCell")
        didCreateLobbyView.filmListTableView.register(DidCreateLobbyTableViewCell.self,
                                                      forCellReuseIdentifier: "filmListCell")
        
        didCreateLobbyView.filmListTableView.estimatedRowHeight = 150
        didCreateLobbyView.filmListTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func configureButtonFunctionality() {
        
        didCreateLobbyView.bottomButton.addTarget(self,
                                                  action: #selector(startButtonDidTapped),
                                                  for: .touchUpInside)
        
        didCreateLobbyView.guestsListButton.addTarget(self,
                                                      action: #selector(checkAllGuestsButtonDidTapped),
                                                      for: .touchUpInside)
    }
    
    // TODO: add full functionality
    
    @objc private func startButtonDidTapped() {
        print("started")
        let controller = SwipeViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func checkAllGuestsButtonDidTapped() {
        
        print("all guests")
        let controller = GuestsListViewController()
        present(controller, animated: true, completion: nil)
    }
    
    @objc private func changeFilmListsButtonDidTapped() {
        
        print("change")
        // temp data append
        tempFilmListNames.append(String(Int.random(in: 10..<100)))
        didCreateLobbyView.filmListTableView.beginUpdates()
        didCreateLobbyView.filmListTableView.insertRows(at: [IndexPath.init(row: tempFilmListNames.count - 1,
                                                                            section: 1)],
                                                        with: .automatic)
        didCreateLobbyView.filmListTableView.endUpdates()
    }
    
    // TODO: i don't know, it needs to be fixed
    
    @objc private func shareButtonDidTapped() {
        
        print("share")
        
        let items: [Any] = [lobbyCode]
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        present(activityController, animated: true, completion: nil)
    }
}

extension DidCreateLobbyController: UITableViewDataSource, UITableViewDelegate {
    
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
            else { return DidCreateLobbyTableViewCell() }
            
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
            
            cell.configure(titleText: lobbyName, code: lobbyCode, type: .create)
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
        didCreateLobbyView.filmListTableView.deleteRows(at: [IndexPath(row: sender.tag, section: 1)], with: .fade)
        didCreateLobbyView.filmListTableView.reloadData()
    }
}
