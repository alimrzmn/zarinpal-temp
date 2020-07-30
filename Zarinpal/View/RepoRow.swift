//
//  RepoRow.swift
//  Zarinpal
//
//  Created by Ali Mirzamani on 7/31/20.
//  Copyright © 2020 Ali Mirzamani. All rights reserved.
//

import SwiftUI

struct RepoRow: View {
    var repo: Repo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(repo.name)")
                .font(.title)
            Text("\(repo.repoDescription ?? "")")
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
}
