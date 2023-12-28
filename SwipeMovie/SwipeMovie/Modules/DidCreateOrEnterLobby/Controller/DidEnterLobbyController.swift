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
//    private var tempFilmListNames = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9", "Test10"]
    
    // MARK: private properties
    
    private var didEnterLobbyView = DidEnteredLobbyView(frame: UIScreen.main.bounds,
                                                          lobbyName: "Название лобби",
                                                          lobbyCode: "123456")
    
    private var lobbyName = "No name"
    
    private var lobbyCode = "000000"
    
    private var timer: Timer?
    
    private var keysArray = Array(FilmsListManager.shared.filmsListDictionary.keys)
    
    private let alert = UIAlertController(title: "Пожалуйста, подождите, пока все участники будут готовы.", message: "\n \n", preferredStyle: .alert)
    
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
        
        timer = Timer.scheduledTimer(timeInterval: 5.0,
                                     target: self,
                                     selector: #selector(reloadTable),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func reloadTable() {
        
        keysArray = Array(FilmsListManager.shared.filmsListDictionary.keys)
//        didEnterLobbyView.filmListTableView.reloadSections([1], with: .automatic)
        didEnterLobbyView.filmListTableView.reloadData()
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
    
    @objc private func startButtonDidTapped() {
        print("ready")
        LobbyManager.shared.userIsReady()
        
//        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: .none))
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
        
        timer = Timer.scheduledTimer(timeInterval: 3.0,
                                     target: self,
                                     selector: #selector(reloadForResults),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc func reloadForResults() {
        print("waiting for results")
        
        if LobbyManager.shared.lobby.startFlag {
            LobbyManager.shared.getAllFilmOfLobby(){
                self.timer?.invalidate()
                self.timer = nil
                if !LobbyManager.shared.filmsInLobby.isEmpty {
                    self.alert.dismiss(animated: true) {
                        let controller = SwipeViewController()
                        self.navigationController?.pushViewController(controller, animated: true)}
                }
            }
        }
    }
    
    @objc private func complaintButtonDidTapped() {
        print("complaint")
        let alert = UIAlertController(title: "Жалоба",
                                      message: "Пожаловаться на название лобби?",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc private func shareButtonDidTapped() {
        print("share")
        
        let items: [Any] = [lobbyCode]
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        present(activityController, animated: true, completion: nil)
    }
}

extension DidEnterLobbyController: UITableViewDataSource, UITableViewDelegate {
    
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
                                                       for: indexPath) as? DidEnterLobbyTableViewCell
        else { return DidEnterLobbyTableViewCell() }
        
            cell.configure(text:
                            FilmsListManager.shared.filmsListDictionary[keysArray[indexPath.row]]?.name ?? "")
            
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
