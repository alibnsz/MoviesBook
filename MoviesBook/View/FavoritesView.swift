//
//  FavoritesView.swift
//  MoviesBook
//
//  Created by Mehmet Ali Bunsuz on 24.07.2024.
//

import SwiftUI

struct FavoritesView: View {
    var favoriteMovieIDs: [String] // Array of favorite movie IDs

    @ObservedObject var movieListViewModel = MovieListViewModel() // Assuming MovieListViewModel can fetch movie details

    var body: some View {
        List(favoriteMovieIDs, id: \.self) { movieID in
            if let movie = movieListViewModel.getMovieByID(movieID) {
                HStack {
                    if let posterURL = URL(string: movie.poster) {
                        AsyncImage(url: posterURL) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                        } placeholder: {
                            Color.gray
                                .frame(width: 100, height: 150)
                        }
                    } else {
                        Color.gray
                            .frame(width: 100, height: 150)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(movie.year)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
                .padding(.vertical, 5)
                .listRowBackground(Color.black)
            }
        }
        .background(Color.black)
    }
}
