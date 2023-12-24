//
//  FilmListView.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 19.11.2023.
//

import UIKit

final class FilmListView: UIView {
    // MARK: - private properties
    private var data: [InfoCellModel] = []
    
    private let filmListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        collection.backgroundColor = UIColor(named: "swipeMovieCollectionViewCell")
        return collection
    }()
    
    private enum Const {
        static let leadingConstant: CGFloat = 15
        static let trailingConstant: CGFloat = -15
        static let cornerRadiusCell: CGFloat = 20
        static let heightCollectionCell: CGFloat = 106
        static let spacingBetweenCells: CGFloat = 12
    }
    
    // MARK: - INIT
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "swipeMovieBlue")
        addSubview(filmListCollectionView)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        filmListCollectionView.backgroundColor = UIColor(named: "swipeMovieBlue")
        
        filmListCollectionView.dataSource = self
        filmListCollectionView.delegate = self
        filmListCollectionView.showsVerticalScrollIndicator = false
        
        filmListCollectionView.register(FilmListCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    // MARK: - layout
    override func layoutSubviews() {
        
        [filmListCollectionView].forEach({ element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
        
        NSLayoutConstraint.activate([
            filmListCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leadingConstant),
            filmListCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Const.trailingConstant),
            filmListCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 22),
            filmListCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - SetUp
    func setData(_ data: [InfoCellModel]) {
        self.data = data
        filmListCollectionView.reloadData()
    }
}
// MARK: - DataSource
extension FilmListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = filmListCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FilmListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = data[indexPath.item]
        
        cell.updateInfo(with: data)
        
        cell.contentView.layer.cornerRadius = Const.cornerRadiusCell
        
        return cell
    }
    
}
// MARK: - DelegateFlowLayout
extension FilmListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: filmListCollectionView.bounds.width, height: Const.heightCollectionCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Const.spacingBetweenCells
    }
}
// MARK: - Delegate
extension FilmListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filmListCollectionView.deselectItem(at: indexPath, animated: true)
    }
}
