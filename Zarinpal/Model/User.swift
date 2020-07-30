//
//  User.swift
//  Zarinpal
//
//  Created by Ali Mirzamani on 7/29/20.
//  Copyright © 2020 Ali Mirzamani. All rights reserved.
//

import SwiftUI

struct User: Decodable {
    let login: String
    let id: Int
    let avatarURL, htmlURL: String?
    let reposURL: String
    let name, location, bio: String?
    var repos: [Repo]?
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
        case reposURL = "repos_url"
        case name, location, bio
    }
}
