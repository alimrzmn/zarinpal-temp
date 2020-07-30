//
//  HomeViewModel.swift
//  Zarinpal
//
//  Created by Ali Mirzamani on 7/31/20.
//  Copyright © 2020 Ali Mirzamani. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.github.com"
let githubUsername = "alimrzmn"

class HomeViewModel: ObservableObject {
    @Published var user: User?

    func fetchUser() {
        guard let url = URL(string: apiUrl+"/users/"+githubUsername) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    DispatchQueue.main.async {
                        self.user = user
                        self.fetchUserRepos(urlString: user.reposURL)
                    }
                } catch {
                    print("something goes wrong")
                }
            }
            
        }.resume()
    }
    
    func fetchUserRepos(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            if let data = data {
                do {
                    let repos = try JSONDecoder().decode([Repo].self, from: data)
                    DispatchQueue.main.async {
                        self.user?.repos = repos
                    }
                } catch {
                    print("something goes wrong")
                }
            }
        }.resume()
    }
}
