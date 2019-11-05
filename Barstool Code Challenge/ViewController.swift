//
//  ViewController.swift
//  Barstool Code Challenge
//
//  Created by Perez Willie Nwobu on 11/4/19.
//  Copyright © 2019 Fusion Corp Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    private var cache: Cache<Int, UIImage> = Cache()
    private var photoFetchQueue = OperationQueue()
    private var fetchRequests: [Int : FetchPhotoOperation] = [:]
    
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
        cell.base = result
        loadImage(forCell: cell, forItemAt: indexPath, base: result)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ReviewCell
        guard let result = cell?.base else { return }
        let vc = ReviewViewController()
        vc.result = result
        vc.bookImageView.image = cell?.resultImageView.image
        present(vc, animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIElementSizes.segmentedControlWidth, height: 450)
    }
    
}

private extension ViewController {
    //function to lead images with operations
     private func loadImage(forCell cell: ReviewCell, forItemAt indexPath: IndexPath, base: Base ) {
         
        // First check if image already exists
         if let image = cache[base.id] {
            cell.resultImageView.image = image
         }
         else {
             // Operation1 : Get Photo
             let op1 = FetchPhotoOperation(photoRef: base)
             
             // Operation2 : SavePhoto
             let op2 = BlockOperation {
                 guard let image = op1.image else { return }
                 self.cache.cache(value: image, for: base.id)
             }
             
             let op3 = BlockOperation {
                 guard let image = op1.image else {
                     print("Something went wrong while getting image from url")
                     return
                }
                 
                 //making sure we on the right cell
                 if indexPath == self.reviewCollectionView.indexPath(for: cell) {
                     cell.resultImageView.image = image

                 } else {
                     //Soon as we get off the cell we cancel all current dataTaks from other cells
                     self.fetchRequests[base.id]?.cancel()
                 }
             }
             op3.addDependency(op1)
             op2.addDependency(op1)
             OperationQueue.main.addOperation(op3)
             photoFetchQueue.addOperations([op1, op2], waitUntilFinished: false)
             
             //fetchOperationtrigger
             fetchRequests[base.id] = op1
         }
         
     }
}
