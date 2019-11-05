//
//  Fonts+Extentions.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/10/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static let headerTitleFont: UIFont = .sfTextSemibold(size: 17)
    static let generalTextFont: UIFont = .sfTextRegular(size: 15)
    static let boldHeader: UIFont = .boldSystemFont(ofSize: 22)
    
    static func sfTextSemibold(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-Semibold", size: size) ?? .systemFont(ofSize: size)
    }
    static func sfTextRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-Regular", size: size) ?? .systemFont(ofSize: size)
    }
}
