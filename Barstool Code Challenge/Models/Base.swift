//
//  Base.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/11/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation


//story title, author, author image url, and story HTML

import Foundation

struct Base : Codable {
    let id : Int?
    let title : String?
    let url : String?
    let thumbnail : Thumbnail?
    let author : Author?
    let brand_name : String?
}
