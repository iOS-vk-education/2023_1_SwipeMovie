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
    
    // MARK: private properties
    
    private var didCreateLobbyView = DidCreatedLobbyView(frame: UIScreen.main.bounds)
    
    private var lobbyName = "No name"
    
    private var lobbyCode = "000000"
    
    private var timer: Timer?
    
    private var keysArray = Array(FilmsListManager.shared.filmsListDictionary.keys)
    
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
        didCreateLobbyView.guestsAreNotReady()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        timer = Timer.scheduledTimer(timeInterval: 2.0,
                                     target: self,
                                     selector: #selector(reloadTableLabelsAndButton),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
        timer = nil
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
    
    @objc private func reloadTableLabelsAndButton() {
        
        keysArray = Array(FilmsListManager.shared.filmsListDictionary.keys)
        didCreateLobbyView.filmListTableView.reloadSections([1], with: .automatic)
        
        print("reloadLabel \(LobbyManager.shared.lobby.guests)")
        didCreateLobbyView.updateGuestNumber(number: LobbyManager.shared.lobby.guests.count)
        
        if !LobbyManager.shared.lobby.filmLists.isEmpty {
            for (_, statement) in LobbyManager.shared.lobby.guests where statement == false {
                didCreateLobbyView.guestsAreNotReady()
                return
            }
            didCreateLobbyView.guestsAreReady()
        }
    }
    
    @objc private func startButtonDidTapped() {
        
        print("started")
        LobbyManager.shared.iAmHosting()
        LobbyManager.shared.startLobby()
        let controller = SwipeViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func checkAllGuestsButtonDidTapped() {
        
        print("all guests")
        let controller = GuestsListViewController()
        present(controller, animated: true, completion: nil)
    }
    
    var flag = true
    
    @objc private func changeFilmListsButtonDidTapped() {
        
        let controller = ChangeGenresListViewController()
        self.navigationController?.pushViewController(controller, animated: true)
        print("change")
        // temp data append
//        if flag {
//            LobbyManager.shared.addFilmListToLobby(filmListId: "x3D2Un5kn3AiPlSDaeXY")
//            flag.toggle()
//        } else {
//            LobbyManager.shared.addFilmListToLobby(filmListId: "Gy88GSgMaQnTPIMLzmMS")
//        }
//        
//        FilmsListManager.shared.getFilmsListNames(id: LobbyManager.shared.lobby.filmLists.last ?? "")
//        keysArray = Array(FilmsListManager.shared.filmsListDictionary.keys)
//        didCreateLobbyView.filmListTableView.reloadData()
//        didCreateLobbyView.filmListTableView.reloadSections([1], with: .automatic)
//        didCreateLobbyView.filmListTableView.beginUpdates()
//        didCreateLobbyView.filmListTableView.insertRows(at: [IndexPath.init(row: keysArray.count - 1,
//                                                                            section: 1)],
//                                                        with: .automatic)
//        didCreateLobbyView.filmListTableView.endUpdates()
    }
    
    // MARK: i don't know, it needs to be fixed
    
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
            return keysArray.count
            
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "filmListCell",
                                                           for: indexPath) as? DidCreateLobbyTableViewCell
            else { return DidCreateLobbyTableViewCell() }
            
            cell.filmListLable.text = FilmsListManager.shared.filmsListDictionary[keysArray[indexPath.row]]?.name ?? ""
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
        
        print(keysArray)
        LobbyManager.shared.deleteFilmListFromLobby(filmListId: keysArray.remove(at: sender.tag))
        print(keysArray)
        didCreateLobbyView.filmListTableView.deleteRows(at: [IndexPath(row: sender.tag, section: 1)], with: .fade)
        didCreateLobbyView.filmListTableView.reloadData()
        didCreateLobbyView.filmListTableView.reloadSections([1], with: .automatic)
    }
}
