//
//  AppearanceManager.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/11/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation
import UIKit
enum AppearanceManager {
    
    static func setUpTheme() {
        // MARK: NavigationBar
        
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
        
        let navBarTitleText = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.headerTitleFont]
        UINavigationBar.appearance().titleTextAttributes = navBarTitleText
        UINavigationBar.appearance().largeTitleTextAttributes = navBarTitleText
        
        UIBarButtonItem.appearance().tintColor = .white
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIToolbar.self]).tintColor = nil
        let barButtonAttributes = [NSAttributedString.Key.font : UIFont.generalTextFont, NSAttributedString.Key.foregroundColor : UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .highlighted)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIToolbar.self]).setTitleTextAttributes(nil, for: .normal)
        let disabledAttributes = [NSAttributedString.Key.foregroundColor : UIColor.clear]
        UIBarButtonItem.appearance().setTitleTextAttributes(disabledAttributes, for: .disabled)
      
        //UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).placeholder = "Search"
    }
}
