//
//  UIImageViewExtention.swift
//  SwipeMovie
//
//  Created by Alexander Bobrun on 25.12.2023.
//

import Foundation
import UIKit

extension UIImageView {
    
    func load(url: URL) {
        
        if let image = FilmManager.shared.imageURLAndUIImageDictionary[url] {
            self.image = image
        } else {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            FilmManager.shared.imageURLAndUIImageDictionary[url] = image
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}
