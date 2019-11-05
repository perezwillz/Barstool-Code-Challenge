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
    
    var base: Base? {
        didSet {
            guard let base = base else { return }
            displayTitleLabel.text = base.title
            brand_Name.text = base.brand_name
            author_Name.text = "Author: \(base.author?.name ?? "")"
            resultImageView.image = #imageLiteral(resourceName: "barstoolLogo")
        }
    }
    
    var resultImageView: UIImageView = {
        let imageView = UIElementsManager.createImageView(image: UIImage(), contentMode: .scaleAspectFill)
        imageView.tintColor = .gray
        imageView.image = #imageLiteral(resourceName: "barstoolLogo")
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
        addSubviews(resultImageView)
        resultImageView.addSubviews(displayTitleLabel,brand_Name,author_Name)
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            // Image
            resultImageView.topAnchor.constraint(equalTo: topAnchor),
            resultImageView.leftAnchor.constraint(equalTo: leftAnchor),
            resultImageView.rightAnchor.constraint(equalTo:rightAnchor),
            resultImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // DisplayTitle
            displayTitleLabel.topAnchor.constraint(equalTo: resultImageView.topAnchor, constant: 16),
            displayTitleLabel.leadingAnchor.constraint(equalTo: resultImageView.leadingAnchor, constant: 8),
            displayTitleLabel.trailingAnchor.constraint(equalTo: resultImageView.trailingAnchor, constant: -8),
             
            // BrandNameLabel
            brand_Name.leadingAnchor.constraint(equalTo: resultImageView.leadingAnchor, constant: 8),
            brand_Name.trailingAnchor.constraint(equalTo: resultImageView.trailingAnchor, constant: 8),
            brand_Name.bottomAnchor.constraint(equalTo: resultImageView.bottomAnchor,constant: -16),
            
            // AuthorNameNameLabel
            author_Name.leadingAnchor.constraint(equalTo: resultImageView.leadingAnchor, constant: 8),
            author_Name.trailingAnchor.constraint(equalTo: resultImageView.trailingAnchor, constant: 8),
            author_Name.bottomAnchor.constraint(equalTo: brand_Name.topAnchor,constant: -16),
            ])
    }
}

