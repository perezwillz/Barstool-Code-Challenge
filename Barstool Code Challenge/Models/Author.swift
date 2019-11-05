//
//  Author.swift
//  Barstool Code Challenge
//
//  Created by Perez Willie Nwobu on 11/4/19.
//  Copyright © 2019 Fusion Corp Design. All rights reserved.
//


import Foundation
struct Author : Codable {
    let id : Int?
    let name : String?
    let author_url : String?
    let avatar : String?
    let twitter_handle : String?
    let has_notifications : Bool?
    let is_active : Bool?
}
