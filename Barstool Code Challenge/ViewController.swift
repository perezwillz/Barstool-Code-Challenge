//
//  ViewController.swift
//  Barstool Code Challenge
//
//  Created by Perez Willie Nwobu on 11/4/19.
//  Copyright © 2019 Fusion Corp Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    private var cache: Cache<String, UIImage> = Cache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        ReviewViewModel.getReviews { (error) in
            self.reviewCollectionView.reloadData()
        }
    }
    
    var reviewCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.register(ReviewCell.self, forCellWithReuseIdentifier: .reviewCollectionViewCellID)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView(){
        hero.isEnabled = true
        reviewCollectionView.delegate = self
        reviewCollectionView.dataSource = self
        view.addSubviews(reviewCollectionView)
        NSLayoutConstraint.activate([
            reviewCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            reviewCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
   
}

private typealias CollectionViewDataSource = ViewController
extension CollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ReviewViewModel.result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .reviewCollectionViewCellID, for: indexPath) as? ReviewCell else { return UICollectionViewCell() }
        let result = ReviewViewModel.result[indexPath.row]
        cell.result = result
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ReviewCell
        guard let result = cell?.result else { return }
        let vc = ReviewViewController()
        vc.result = result
        vc.bookImageView.image = cell?.renameImageView.image
        present(vc, animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIElementSizes.segmentedControlWidth, height: 450)
    }
    
}

