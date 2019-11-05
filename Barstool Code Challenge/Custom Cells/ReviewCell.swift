//
//  ReviewCell.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/10/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation
import UIKit

class ReviewCell: UICollectionViewCell {
    
    var result: Base? {
        didSet {
            guard let result = result else { return }
            displayTitleLabel.text = result.title
            brand_Name.text = result.brand_name
            author_Name.text = "Author: \(result.author?.name ?? "")"
            renameImageView.image = #imageLiteral(resourceName: "The-Godfather-2-240x300")
            guard let imageUrl = result.thumbnail?.raw else {return}
            NetworkManager.getImage(urlString: imageUrl, completion: { (image, error) in
                guard let image = image else {return}
                self.renameImageView.image = image
                self.renameImageView.hero.id = .url
            })
        }
    }
    
    var renameImageView: UIImageView = {
        let imageView = UIElementsManager.createImageView(image: UIImage(), contentMode: .scaleAspectFill)
        imageView.tintColor = .gray
        imageView.image = #imageLiteral(resourceName: "The-Godfather-2-240x300")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let displayTitleLabel: UILabel = {
        let label = UIElementsManager.createLabel(text: "", font: .boldSystemFont(ofSize: 30), textColor: .white, adjustsFontSizeToFitWidth: true, numberOfLines: 0)
        label.textAlignment = .left
        return label
    }()
    
    let brand_Name: UILabel = {
        let label = UIElementsManager.createLabel(text: "", font: .boldSystemFont(ofSize: 23), textColor: .white, adjustsFontSizeToFitWidth: false, numberOfLines: 3)
        label.textAlignment = .left
        return label
    }()
    
    let author_Name: UILabel = {
        let label = UIElementsManager.createLabel(text: "", font: .boldSystemFont(ofSize: 23), textColor: .white, adjustsFontSizeToFitWidth: false, numberOfLines: 3)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        hero.isEnabled = true
        backgroundColor = .white
        layer.cornerRadius = 6
        addSubviews(renameImageView)
        renameImageView.addSubviews(displayTitleLabel,brand_Name,author_Name)
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            // Image
            renameImageView.topAnchor.constraint(equalTo: topAnchor),
            renameImageView.leftAnchor.constraint(equalTo: leftAnchor),
            renameImageView.rightAnchor.constraint(equalTo:rightAnchor),
            renameImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // DisplayTitle
            displayTitleLabel.topAnchor.constraint(equalTo: renameImageView.topAnchor, constant: 16),
            displayTitleLabel.leadingAnchor.constraint(equalTo: renameImageView.leadingAnchor, constant: 8),
            displayTitleLabel.trailingAnchor.constraint(equalTo: renameImageView.trailingAnchor, constant: -8),
             
            // BrandNameLabel
            brand_Name.leadingAnchor.constraint(equalTo: renameImageView.leadingAnchor, constant: 8),
            brand_Name.trailingAnchor.constraint(equalTo: renameImageView.trailingAnchor, constant: 8),
            brand_Name.bottomAnchor.constraint(equalTo: renameImageView.bottomAnchor,constant: -16),
            
            // AuthorNameNameLabel
            author_Name.leadingAnchor.constraint(equalTo: renameImageView.leadingAnchor, constant: 8),
            author_Name.trailingAnchor.constraint(equalTo: renameImageView.trailingAnchor, constant: 8),
            author_Name.bottomAnchor.constraint(equalTo: brand_Name.topAnchor,constant: -16),
            ])
    }
}

