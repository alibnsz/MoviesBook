//
//  CustomTabView.swift
//  MoviesBook
//
//  Created by Mehmet Ali Bunsuz on 24.07.2024.
//

import SwiftUI

struct CustomTabView: View {
    
    var body: some View {
        TabView {
            
            MovieListView()
                .tabItem {
                    Image(systemName: "film")
                    Text("Movies")
                    
                }
            
            Image(systemName: "bookmark.fill")
                .resizable()
                .frame(width: 80, height: 120)
                .foregroundColor(.gray)
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Favorites")
                }
            ProfileView()
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
        .accentColor(.red)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CustomTabView()
}



