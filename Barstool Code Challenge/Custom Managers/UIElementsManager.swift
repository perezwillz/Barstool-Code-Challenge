//
//  UIElementsManager.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/11/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation
import UIKit


enum UIElementsManager {
    
    static func image(fromLayer layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }
  
    
    static func createImageView(image: UIImage? = nil, tintColor: UIColor? = nil, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImageView {
        
        let imageView: UIImageView
        if let image = image {
            imageView = UIImageView(image: image)
        } else {
            imageView = UIImageView()
        }
        if let tintColor = tintColor {
            imageView.tintColor = tintColor
        }
        imageView.contentMode = contentMode
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    static func createLabel(text: String, font: UIFont = .headerTitleFont, textColor: UIColor = .white, adjustsFontSizeToFitWidth: Bool = false, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        label.numberOfLines = numberOfLines
        // label.adjustsFontForContentSizeCategory = true
        return label
    }
    
    static func createTextView(text: String, font: UIFont = .generalTextFont, textColor: UIColor = .black, backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 5) -> UITextView {
        
        let textView = UITextView()
        textView.text = text
        textView.font = font
        textView.textColor = textColor
        textView.backgroundColor = backgroundColor
        textView.layer.cornerRadius = cornerRadius
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        
        return textView
    }
    
    static func createUIButton(title: String, fontName: String, fontSize: CGFloat, borderWidth: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel!.font = UIFont(name: fontName, size: fontSize)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.layer.borderWidth = borderWidth
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    static func addDoneButtonToTextView(_ textView: UITextView, selector: Selector?) {
        let doneToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: selector)
        
        doneToolbar.items = [flexSpace, doneButton]
        doneToolbar.sizeToFit()
        
        textView.inputAccessoryView = doneToolbar
    }
    
    static func createStackView(axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 16) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    static func createTableView(cellClassesAndIDs: [String: AnyClass], style: UITableView.Style = .plain) -> UITableView {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: style)
        for (id, cellClass) in cellClassesAndIDs {
            tableView.register(cellClass, forCellReuseIdentifier: id)
        }
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
    
    static func createTableView(cellClass: AnyClass, reuseID: String, style: UITableView.Style = .plain) -> UITableView {
        return UIElementsManager.createTableView(cellClassesAndIDs: [reuseID: cellClass], style: style)
    }
    
 
    
    static func createSearchBar(placeholder : String = "Search") -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = placeholder
        return searchBar
    }
    
    
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(cancelAction)
        return alertController
    }
}
