//
//  DidEnteredLobbyController.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 10.11.2023.
//

import Foundation
import UIKit

final class DidEnteredLobbyController: UIViewController {
    
    // MARK: private properties
    
    // temp data for cells
    var tempFilmListNames = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9", "Test10"]
    
    private var didEnteredLobbyView = DidEnteredLobbyView(frame: UIScreen.main.bounds,
                                                          lobbyName: "Название лобби",
                                                          lobbyCode: "123456")
    
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
        
        didEnteredLobbyView.filmListTableView.delegate = self
        didEnteredLobbyView.filmListTableView.dataSource = self
        didEnteredLobbyView.filmListTableView.register(DidEnterLobbyTableViewCell.self,
                                                       forCellReuseIdentifier: "cell")
        didEnteredLobbyView.bottomButton.addTarget(self,
                                                   action: #selector(startButtonDidTapped),
                                                   for: .touchUpInside)
    }
    
    // MARK: private methods
    
    // TODO: add full functionality
    
    @objc private func startButtonDidTapped() {
        print("ready")
    }
    
    @objc private func complaintButtonDidTapped() {
        print("complaint")
    }
}

extension DidEnteredLobbyController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tempFilmListNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                       for: indexPath) as? DidEnterLobbyTableViewCell
        else { return UITableViewCell() }
        
        cell.filmListLable.text = tempFilmListNames[indexPath.row]
        
        return cell
    }

}
