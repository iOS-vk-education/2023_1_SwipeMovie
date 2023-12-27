//
//  GuestsListViewController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 04.12.2023.
//

import Foundation
import UIKit

final class GuestsListViewController: UIViewController {
    
    // MARK: properties
    
    // MARK: private properties
    
    private var guestsListView = GuestsListView(frame: UIScreen.main.bounds)
    
    private var timer: Timer?
    
    private var keysArray = Array(LobbyManager.shared.lobby.guests.keys)
    
    // MARK: methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = guestsListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guestsListView.guestsListTableView.delegate = self
        guestsListView.guestsListTableView.dataSource = self
        guestsListView.guestsListTableView.allowsSelection = false
        guestsListView.guestsListTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        guestsListView.guestsListTableView.register(GuestsListTableViewCell.self,
                                                    forCellReuseIdentifier: "guestsListCell")
        guestsListView.exitButton.addTarget(self,
                                            action: #selector(exitButtonDidTapped),
                                            for: .touchUpInside)
        timer = Timer.scheduledTimer(timeInterval: 5.0,
                                     target: self,
                                     selector: #selector(reloadTableData),
                                     userInfo: nil,
                                     repeats: true)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    @objc
    private func exitButtonDidTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func reloadTableData() {
        keysArray = Array(LobbyManager.shared.lobby.guests.keys)
        print("reload")
        print(LobbyManager.shared.lobby.guests)
        guestsListView.guestsListTableView.reloadSections([0], with: .automatic)
    }
}

extension GuestsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        keysArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "guestsListCell",
                                                       for: indexPath) as? GuestsListTableViewCell
        else { return GuestsListTableViewCell() }
            
        cell.configure(text: UserManager.shared.userAndName[keysArray[indexPath.row]] ?? "")
        
        if LobbyManager.shared.lobby.guests[keysArray[indexPath.row]] ?? false {
            cell.guestIsReady()
        } else {
            cell.guestIsNotReady()
        }
        
        return cell
    }
}
