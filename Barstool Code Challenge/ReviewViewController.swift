//
//  ReviewViewController.swift
//  Barstool Code Challenge
//
//  Created by Perez Willie Nwobu on 11/4/19.
//  Copyright © 2019 Fusion Corp Design. All rights reserved.
//

import UIKit
import Hero


class ReviewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setupView()
    }
    
    var result : Base?{
        didSet {
            guard isViewLoaded else { return }
            updateViews()
        }
    }
    
    func updateViews(){
        guard let result = result else { return }
        summaryTextView.text = result.title
        bookImageView.hero.id = .url
    }
    
    func setupView(){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        view.addGestureRecognizer(pan)
        hero.isEnabled = true
        view.addSubviews(bookImageView,summaryTextView, urlButton)
        constrainView()
    }
    
    var bookImageView: UIImageView = {
        let imageView = UIElementsManager.createImageView(image: UIImage(), contentMode: .scaleAspectFill)
        imageView.tintColor = .gray
        imageView.image = #imageLiteral(resourceName: "barstoolLogo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let summaryTextView: UITextView = {
        let textView = UIElementsManager.createTextView(text: "", font: .boldHeader, textColor: .black, backgroundColor: .white, cornerRadius: 0)
        textView.textAlignment = .center
        return textView
    }()
    
    let urlButton : UIButton = {
        let button = UIElementsManager.createUIButton(title: "Read more...", fontName: "AvenirNext-Bold", fontSize: 22, borderWidth: 0)
        button.addTarget(self, action: #selector(openURL), for: .touchUpInside)
        return button
    }()
    
    @objc func openURL(){
        
        guard let urlString = result?.url else { return }
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
        print(urlString)
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            hero.dismissViewController()
        case .changed:
            let translation = sender.translation(in: nil)
            let progress = translation.y / 2 / view.bounds.height
            Hero.shared.update(progress)
        default:
           Hero.shared.finish()
        }
    }
    
    func constrainView(){
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: view.topAnchor),
            bookImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bookImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bookImageView.heightAnchor.constraint(equalToConstant: UIElementSizes.windowHeight/2),
            
            summaryTextView.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 0),
            summaryTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            summaryTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            summaryTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            urlButton.heightAnchor.constraint(equalToConstant: 50),
            urlButton.leadingAnchor.constraint(equalTo: summaryTextView.leadingAnchor, constant: 16),
            urlButton.trailingAnchor.constraint(equalTo: summaryTextView.trailingAnchor, constant:  -16),
            urlButton.bottomAnchor.constraint(equalTo: summaryTextView.bottomAnchor, constant: -32),
            
            ])
    }
}
