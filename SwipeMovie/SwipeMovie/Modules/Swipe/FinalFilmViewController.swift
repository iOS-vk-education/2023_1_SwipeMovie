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
        let backgroundColor: UIColor  = UIColor(named: "Color 1")!
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
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.text = "Корпорация монстров (2001)"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment  =  .center
        label.textColor = .black
        return label
    }()
    
    private let labelFilmCategory: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Monsters, Inc. 0+"
        label.font  = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    private let buttonGoToMenu: UIButton = {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let borderColor: UIColor = UIColor(named: "Color 2")!
        button.setTitle("Выйти в меню", for: .normal)
        let titleColor: UIColor = borderColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.borderWidth = 2.0
        
        button.layer.borderColor = borderColor.cgColor
        button.layer.cornerRadius = 20.0
        return button
    }()

    private let buttonGoToMovePage: UIButton = {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Открыть страницу фильма", for: .normal)
        let titleColor: UIColor = .white
        button.setTitleColor(titleColor, for: .normal)
        
        let backgroundColor: UIColor  = UIColor(named: "Color 2")!
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 20.0
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "Color 2")!
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
    
    func createViewGrayConstraint(){
        viewGray.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewGray.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewGray.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewGray.heightAnchor.constraint(equalToConstant: 750).isActive = true
        viewGray.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func createLabelWinnerConstraint(){
        labelWinner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        labelWinner.topAnchor.constraint(equalTo: view.topAnchor, constant: 47).isActive = true
        labelWinner.widthAnchor.constraint(equalToConstant: 315).isActive = true
        labelWinner.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    func createImageFilmConstraint(){
        imageFilm.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29).isActive = true
        imageFilm.topAnchor.constraint(equalTo: view.topAnchor, constant: 132).isActive = true
        imageFilm.widthAnchor.constraint(equalToConstant: 335).isActive = true
        imageFilm.heightAnchor.constraint(equalToConstant: 481).isActive = true
    }
    
    func createlabelFilmNameConstraint(){
        labelFilmName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34).isActive  = true
        labelFilmName.topAnchor.constraint(equalTo: view.topAnchor, constant: 641).isActive = true
        labelFilmName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func createLabelFilmCategoryConstraint(){
        labelFilmCategory.topAnchor.constraint(equalTo: labelFilmName.bottomAnchor).isActive = true
        labelFilmCategory.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func  createButtonGoToMovePageConstraint(){
        buttonGoToMovePage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29).isActive =  true
        buttonGoToMovePage.topAnchor.constraint(equalTo: view.topAnchor, constant: 704).isActive = true
        buttonGoToMovePage.widthAnchor.constraint(equalToConstant: 335).isActive = true
        buttonGoToMovePage.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func createButtonGoToMenuConstraint(){
        buttonGoToMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29).isActive = true
        buttonGoToMenu.topAnchor.constraint(equalTo: view.topAnchor, constant: 774).isActive = true
        buttonGoToMenu.widthAnchor.constraint(equalToConstant: 335).isActive = true
        buttonGoToMenu.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
