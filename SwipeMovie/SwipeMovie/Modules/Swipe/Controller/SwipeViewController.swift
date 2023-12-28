//
//  SwipeViewController.swift
//  SwipeMovie
//
//  Created by mac on 18.11.2023.
//

import UIKit

class SwipeViewController: UIViewController {

    // MARK: private properties
    
    private var swipeView = SwipeView(frame: UIScreen.main.bounds, image: UIImage(), name: "test")
    
    private var filmSet = Set(LobbyManager.shared.filmsInLobby)
    
    private var film = Film()
    
    private var timer: Timer?
    
    private  let alert = UIAlertController(title: "Пожалуйста, подождите, пока все участники закончат.", message: "\n \n", preferredStyle: .alert)
    
    // MARK: methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
//        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = swipeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        film = filmSet.removeFirst()
        swipeView.labelFilmName.text = film.name
        swipeView.imageFilm.load(url: URL(string: film.imageURL)!)
        
        swipeView.buttonDislike.addTarget(self, action: #selector(dislikeButtonDidTapped), for: .touchUpInside)
        swipeView.buttonLike.addTarget(self, action: #selector(likeButtonDidTapped), for: .touchUpInside)
        swipeView.buttonInfo.addTarget(self, action: #selector(infoButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func dislikeButtonDidTapped() {
        print("dislike")
        showNextFilm()
    }
    
    @objc private func likeButtonDidTapped() {
        print("like")
        LobbyManager.shared.likeFilm(filmId: film.id)
        showNextFilm()
    }
    
    @objc private func infoButtonDidTapped() {
        print("info")
        let controller = MoviePageViewController()
        controller.createMoviePageView.configureMoviePageView(
                    imageURL: film.imageURL,
                    movieName: film.name,
                    description: film.description)
        present(controller, animated: true)
    }
    
    private func showNextFilm() {
        if !filmSet.isEmpty {
            film = filmSet.removeFirst()
            swipeView.labelFilmName.text = film.name
            swipeView.imageFilm.load(url: URL(string: film.imageURL)!)
            
        } else {
            
            LobbyManager.shared.userIsReady()
            LobbyManager.shared.sendLikedFilms()
            
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
    }
    
    @objc func reloadForResults() {
        print("waiting for results")
        if LobbyManager.shared.isHost {
            LobbyManager.shared.getFinalFilm()
        }
        
        if LobbyManager.shared.lobby.finalFlag {
            
            if !LobbyManager.shared.lobby.finalFilm.isEmpty {
                timer?.invalidate()
                timer = nil
                alert.dismiss(animated: true) {
                    let controller = FinalFilmViewController()
                    self.navigationController?.pushViewController(controller, animated: true)}
            }
        }
    }
}
