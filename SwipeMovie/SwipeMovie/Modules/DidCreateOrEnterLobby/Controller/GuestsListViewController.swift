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
    
    // temp data for cells
    private var guestsList = [["Guest1", true], ["Guest2", true], ["Guest3", false],
                              ["Guest4", true], ["Guest5", true], ["Guest6", true],
                              ["Guest7", false]]
    
    // MARK: private properties
    
    private var guestsListView = GuestsListView(frame: UIScreen.main.bounds)
    
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
        guestsListView.guestsListTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        guestsListView.guestsListTableView.register(GuestsListTableViewCell.self,
                                                    forCellReuseIdentifier: "guestsListCell")
        guestsListView.exitButton.addTarget(self,
                                            action: #selector(exitButtonDidTapped),
                                            for: .touchUpInside)
    }
    
    @objc
    private func exitButtonDidTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension GuestsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guestsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "guestsListCell",
                                                       for: indexPath) as? GuestsListTableViewCell
        else { return GuestsListTableViewCell() }
            
        // гарантируем, что имеем дело со String
        cell.configure(text: (guestsList[indexPath.row][0] as? String)!)
   
        if guestsList[indexPath.row][1] as? Bool ?? false {
            cell.guestIsReady()
            
        } else {
            cell.guestIsNotReady()
        }
        
        return cell
    }
}
