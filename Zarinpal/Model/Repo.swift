//
//  Repo.swift
//  Zarinpal
//
//  Created by Ali Mirzamani on 7/30/20.
//  Copyright © 2020 Ali Mirzamani. All rights reserved.
//

import SwiftUI

struct Repo: Decodable, Identifiable {
    let id: Int
    let name, fullName: String
    let repoPrivate: Bool
    let htmlURL: String
    let repoDescription: String?
    let language: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case fullName = "full_name"
        case repoPrivate = "private"
        case htmlURL = "html_url"
        case repoDescription = "description"
        case language
    }
}
