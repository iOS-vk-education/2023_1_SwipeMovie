//
//  FinalFilmViewController.swift
//  SwipeMovie
//
//  Created by mac on 18.11.2023.
//

import UIKit

class FinalFilmViewController: UIViewController {
    
    // MARK: private properties
    
    private var finalFilmView = FinalFilmView(frame: UIScreen.main.bounds, image: UIImage(), name: "test")
    
    // MARK: methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = finalFilmView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalFilmView.labelFilmName.text = FilmManager.shared.filmsDictionary[LobbyManager.shared.lobby.finalFilm]?.name
        finalFilmView.imageFilm.load(url: URL(string: FilmManager.shared.filmsDictionary[LobbyManager.shared.lobby.finalFilm]?.imageURL ?? "") ?? URL(string: "https://firebasestorage.googleapis.com/v0/b/swipemovie-53353.appspot.com/o/IMG_1010.PNG?alt=media&token=2d4b188e-db49-494a-98b7-cffeb71ef2df")!)
        LobbyManager.shared.addFilmToHistory()
        finalFilmView.buttonGoToMenu.addTarget(self,
                                               action: #selector(goToMenuButtonDidTapped),
                                               for: .touchUpInside)
        finalFilmView.buttonGoToMoviePage.addTarget(self,
                                                    action: #selector(goToMovieButtonDidTapped),
                                                    for: .touchUpInside)
    }
    
    @objc private func goToMenuButtonDidTapped() {
        print("go to menu")
        UserManager.shared.user.historyItems.append(LobbyManager.shared.lobby.likedFilms[0])
        UserManager.shared.sendUser()
        navigationController!.popToRootViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc private func goToMovieButtonDidTapped() {
        print("go to movie page")
        
        let controller = MoviePageViewController()
        
        controller.createMoviePageView.configureMoviePageView(
            imageURL: FilmManager.shared.filmsDictionary[LobbyManager.shared.lobby.finalFilm]?.imageURL ?? "https://firebasestorage.googleapis.com/v0/b/swipemovie-53353.appspot.com/o/IMG_1010.PNG?alt=media&token=2d4b188e-db49-494a-98b7-cffeb71ef2df",
            movieName: FilmManager.shared.filmsDictionary[LobbyManager.shared.lobby.finalFilm]?.name ?? "Film",
            description: FilmManager.shared.filmsDictionary[LobbyManager.shared.lobby.finalFilm]?.description ?? "Film")
        
        present(controller, animated: true)
        
    }
}
