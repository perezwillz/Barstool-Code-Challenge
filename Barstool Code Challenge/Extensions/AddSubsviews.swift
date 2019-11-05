//
//  AddSubsviews.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/11/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.


import Foundation

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
