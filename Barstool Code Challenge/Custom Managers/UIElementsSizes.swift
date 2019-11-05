//
//  UIElementsSizes.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/10/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation
import UIKit

struct UIElementSizes {
    
    static var windowWidth: CGFloat = UIScreen.main.bounds.width
    static var windowHeight: CGFloat = UIScreen.main.bounds.height
    static var navigationBarMaxY: CGFloat = 75
    
    static var labelWidth: CGFloat = UIScreen.main.bounds.width - 50
    static var splitViewSegmentedControlWidth: CGFloat = UIScreen.main.bounds.width/3 - 32
    
    static var textFieldWidth: CGFloat = UIScreen.main.bounds.width - 50
    static var singleLineTextFieldHeight: CGFloat = 50
    static var multilineTextFieldHeight: CGFloat = 200
    
    static var segmentedControlWidth: CGFloat = UIScreen.main.bounds.width - 50
    static var segmentedControlHeight: CGFloat = 50
    
    static var buttonWidth: CGFloat = UIScreen.main.bounds.width / 2
    static var buttonHeight: CGFloat = 50
    
    static let cellHeight: CGFloat = 65
    static let cellPadding: CGFloat = 10
    static let cellTitleAndDetailSpace: CGFloat = 4
}
