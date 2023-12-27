//
//  SwipeView.swift
//  SwipeMovie
//
//  Created by mac on 25.12.2023.
//

import Foundation
import UIKit

final class SwipeView: UIView {
    
    // MARK: properties
    
    let buttonDislike: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let imageDislike = UIImage(named: "ImageDisLike")
        button.setBackgroundImage(imageDislike, for: .normal)
        return button
    }()
    
    let buttonInfo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints  = false
        let imageInfo = UIImage(named: "ImageInfo")
        button.setImage(imageInfo, for: .normal)
        return button
    }()
    
    let buttonLike: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints  = false
        let imageLike = UIImage(named: "ImageLike")
        button.setImage(imageLike, for: .normal)
        return button
    }()
    
    // MARK: private properties
    
    private let viewGray: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "swipeMovieWhite")!
        view.layer.cornerRadius = 40.0
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private let labelSwipe: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Свайпай!"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.textColor = .white
        return label
    }()
    
    var imageFilm: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ImageFilm")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var labelFilmName: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
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
        label.isHidden = true
        return label
    }()
    
    // MARK: methods
    
    init(frame: CGRect, image: UIImage, name: String) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "swipeMovieBlue")
        
        labelFilmName.text = name
        imageFilm.image = image
        
        createConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private methods
    
    private func createConstrainst() {
        
        addSubview(labelSwipe)
        addSubview(viewGray)
        viewGray.addSubview(imageFilm)
        viewGray.addSubview(labelFilmName)
        viewGray.addSubview(labelFilmCategory)
        viewGray.addSubview(buttonDislike)
        viewGray.addSubview(buttonInfo)
        viewGray.addSubview(buttonLike)
        
        createViewGrayConstraint()
        createLabelSwipeConstraint()
        createImageFilmConstraint()
        createlabelFilmNameConstraint()
        createLabelFilmCategoryConstraint()
        createButtonDislikeConstraint()
        createButtonInfoConstraint()
        createButtonLikeConstraint()
    }
    
    private func createViewGrayConstraint() {
        viewGray.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        viewGray.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        viewGray.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        viewGray.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.88).isActive = true
        viewGray.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    private func createLabelSwipeConstraint() {
        labelSwipe.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        labelSwipe.bottomAnchor.constraint(equalTo: viewGray.topAnchor).isActive = true
        labelSwipe.widthAnchor.constraint(equalToConstant: 315).isActive = true
        labelSwipe.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func createImageFilmConstraint() {
        imageFilm.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageFilm.topAnchor.constraint(equalTo: viewGray.topAnchor, constant: 20).isActive = true
        imageFilm.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        imageFilm.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.56).isActive = true
    }
    
    private func createlabelFilmNameConstraint() {
        labelFilmName.topAnchor.constraint(equalTo: imageFilm.bottomAnchor, constant: 20).isActive = true
        labelFilmName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    private func createLabelFilmCategoryConstraint() {
        labelFilmCategory.topAnchor.constraint(equalTo: labelFilmName.bottomAnchor).isActive = true
        labelFilmCategory.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func createButtonDislikeConstraint() {
        buttonDislike.topAnchor.constraint(equalTo:
                                            labelFilmCategory.bottomAnchor,
                                           constant: 40).isActive = true
        buttonDislike.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 57).isActive = true
        buttonDislike.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonDislike.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func createButtonInfoConstraint() {
        buttonInfo.topAnchor.constraint(equalTo:
                                            labelFilmCategory.bottomAnchor,
                                        constant: 40).isActive = true
        buttonInfo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonInfo.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonInfo.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func createButtonLikeConstraint() {
        buttonLike.topAnchor.constraint(equalTo:
                                            labelFilmCategory.bottomAnchor,
                                        constant: 40).isActive = true
        buttonLike.trailingAnchor.constraint(equalTo: trailingAnchor,
                                             constant: -57).isActive = true
        buttonLike.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonLike.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}
