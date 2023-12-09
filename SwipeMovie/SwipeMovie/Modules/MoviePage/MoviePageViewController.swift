//
//  MoviePageViewController.swift
//  SwipeMovie
//
//  Created by Arseniy Apollonov on 08.12.2023.
//

import UIKit

class MoviePageViewController: UIViewController {
    
    private var createMoviePageView = MoviePageView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = createMoviePageView
    }
}
