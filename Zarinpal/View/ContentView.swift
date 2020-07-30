//
//  ContentView.swift
//  Zarinpal
//
//  Created by Ali Mirzamani on 7/29/20.
//  Copyright © 2020 Ali Mirzamani. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var homeVM = HomeViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        
        homeVM.fetchUser()
    }
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Text(self.homeVM.user?.name ?? "Fullname")
                        .font(.largeTitle)
                    Text(self.homeVM.user?.bio ?? "Bio")
                    Text(self.homeVM.user?.location ?? "Location")
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)
                ForEach (homeVM.user?.repos ?? []) { repo in
                    RepoRow(repo: repo)
                }
                .padding(.top, 20)
            }
            .navigationBarTitle("Github User")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
