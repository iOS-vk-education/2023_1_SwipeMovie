//
//  ChangeGenresView.swift
//  SwipeMovie
//
//  Created by Егор Иванов on 26.11.2023.
//

import UIKit

final class ChangeGenresView: UIView {
    var onCellTap: ((Int) -> ())?
    
    // MARK: - private properties
    
    let filmListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
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
        
        filmListCollectionView.register(ChangeGenresCollectionCell.self, forCellWithReuseIdentifier: "cell")
    }
    // MARK: - layout
    override func layoutSubviews() {
        
        [filmListCollectionView].forEach({ element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
        NSLayoutConstraint.activate([
            filmListCollectionView.topAnchor.constraint(equalTo: topAnchor),
            filmListCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leadingConstant),
            filmListCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Const.trailingConstant),
            filmListCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: - SetUp
    var filmListsKeysArr = Array(FilmsListManager.shared.allFilmsListDictionary.keys)
}

// MARK: - DataSource
extension ChangeGenresView: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmListsKeysArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = filmListCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ChangeGenresCollectionCell else {
            return ChangeGenresCollectionCell()
        }
        cell.contentView.layer.cornerRadius = Const.cornerRadiusCell
        let filmsList = FilmsListManager.shared.allFilmsListDictionary[filmListsKeysArr[indexPath.row]]
        cell.configureCell(id: filmsList?.id ?? "",
                           name: filmsList?.name ?? "",
                           description: filmsList?.description ?? "")
        return cell
    }
}
// MARK: - DelegateFlowLayout
extension ChangeGenresView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: filmListCollectionView.bounds.width, height: Const.heightCollectionCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Const.spacingBetweenCells
    }
}
// MARK: - Delegate
extension ChangeGenresView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filmListCollectionView.deselectItem(at: indexPath, animated: true)
        onCellTap?(indexPath.item)
    }
}
