//
//  FinalFilmViewController.swift
//  SwipeMovie
//
//  Created by mac on 18.11.2023.
//

import UIKit

class FinalFilmViewController: UIViewController {

    private let viewGray: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let backgroundColor: UIColor = UIColor(named: "swipeMovieWhite")!
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = 40.0
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private let labelWinner: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Победитель!"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.textColor = .white
        return label
    }()
    
    private let imageFilm: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ImageFilm")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelFilmName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Корпорация монстров (2001)"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment  = .center
        label.textColor = .black
        return label
    }()
    
    private let labelFilmCategory: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Monsters, Inc. 0+"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    private let buttonGoToMenu: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let borderColor: UIColor = UIColor(named: "swipeMovieBlue")!
        button.setTitle("Выйти в меню", for: .normal)
        let titleColor: UIColor = borderColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = borderColor.cgColor
        button.layer.cornerRadius = 20.0
        return button
    }()

    private let buttonGoToMovePage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Открыть страницу фильма", for: .normal)
        let titleColor: UIColor = .white
        button.setTitleColor(titleColor, for: .normal)
        let backgroundColor: UIColor = UIColor(named: "swipeMovieBlue")!
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 20.0
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "swipeMovieBlue")!
        view.addSubview(labelWinner)
        view.addSubview(viewGray)
        view.addSubview(imageFilm)
        view.addSubview(labelFilmName)
        view.addSubview(labelFilmCategory)
        view.addSubview(buttonGoToMovePage)
        view.addSubview(buttonGoToMenu)
        
        createViewGrayConstraint()
        createLabelWinnerConstraint()
        createImageFilmConstraint()
        createlabelFilmNameConstraint()
        createLabelFilmCategoryConstraint()
        createButtonGoToMovePageConstraint()
        createButtonGoToMenuConstraint()
    }
    
    private func createViewGrayConstraint() {
        viewGray.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewGray.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewGray.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewGray.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.88).isActive = true
        viewGray.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    private func createLabelWinnerConstraint() {
        labelWinner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        labelWinner.bottomAnchor.constraint(equalTo: viewGray.topAnchor).isActive = true
        labelWinner.widthAnchor.constraint(equalToConstant: 315).isActive = true
        labelWinner.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func createImageFilmConstraint() {
        imageFilm.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageFilm.topAnchor.constraint(equalTo: viewGray.topAnchor, constant: 20).isActive = true
        imageFilm.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        imageFilm.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.56).isActive = true
    }
    
    private func createlabelFilmNameConstraint() {
        labelFilmName.topAnchor.constraint(equalTo: imageFilm.bottomAnchor, constant: 20).isActive = true
        labelFilmName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func createLabelFilmCategoryConstraint() {
        labelFilmCategory.topAnchor.constraint(equalTo: labelFilmName.bottomAnchor).isActive = true
        labelFilmCategory.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func createButtonGoToMovePageConstraint() {
        buttonGoToMovePage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonGoToMovePage.topAnchor.constraint(equalTo: labelFilmCategory.bottomAnchor, constant: 10).isActive = true
        buttonGoToMovePage.widthAnchor.constraint(equalToConstant: 335).isActive = true
        buttonGoToMovePage.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func createButtonGoToMenuConstraint() {
        buttonGoToMenu.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonGoToMenu.topAnchor.constraint(equalTo: labelFilmCategory.bottomAnchor, constant: 70).isActive = true
        buttonGoToMenu.widthAnchor.constraint(equalToConstant: 335).isActive = true
        buttonGoToMenu.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
