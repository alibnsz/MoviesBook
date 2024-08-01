//
//  ContentView.swift
//  MoviesBook
//
//  Created by Mehmet Ali Bunsuz on 23.07.2024.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieListViewModel: MovieListViewModel
    @State private var searchText = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack(spacing: 0) {
                        Text("Movie")
                            .font(.custom("CopperPlate", size: 50))
                            .bold()
                            .foregroundStyle(.red.opacity(0.7))
                        Text("Book")
                            .font(.custom("CopperPlate", size: 50))
                            .bold()
                            .foregroundStyle(.white.opacity(0.7))
                        Spacer()
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                    .padding(.horizontal, 20)
                    
                    HStack {
                        Spacer()
                        
                        HStack {
                            TextField("Search movies...", text: $searchText)
                                .foregroundColor(.white)
                                .accentColor(.white)
                                .padding(14)
                                .background(Color.black.opacity(0.4))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.gray, lineWidth: 0.7)
                            )
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            Button(action: {
                                movieListViewModel.MovieSearch(movieName: searchText)
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .padding(17)
                                    .background(Color.white.opacity(0.8))
                                    .foregroundColor(.black)
                                    .cornerRadius(15)
                            }.padding(.horizontal, 20)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.leading)
                }
                .background(Color.black)
                .padding(.vertical,20)
                if searchText.isEmpty {
                    HStack() {
                        Text("Top Movies")
                            .font(.custom("CopperPlate", size: 20))
                            .bold()
                            .foregroundStyle(.white.opacity(0.7))
                        Spacer()
                    }
                    .padding(.horizontal, 27)
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(movieListViewModel.staticMovies.isEmpty ? movieListViewModel.movies : movieListViewModel.staticMovies, id: \.imdbID) { movie in
                            NavigationLink(destination: MovieDetailView(imdbID: movie.imdbID)) {
                                VStack {
                                    if let posterURL = URL(string: movie.poster) {
                                        AsyncImage(url: posterURL) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150, height: 225)
                                                .clipped()
                                                .cornerRadius(12)
                                        } placeholder: {
                                            Color.gray
                                                .frame(width: 150, height: 225)
                                        }
                                    } else {
                                        Color.gray
                                            .frame(width: 150, height: 225)
                                    }
                                    
                                    Text(movie.title)
                                        .font(.custom("Impact", size: 16))
                                        .foregroundColor(.white)
                                        .padding(.top, 5)
                                        .multilineTextAlignment(.center)
                                    Text(movie.year)
                                        .font(.custom("Impact", size: 16))
                                        .foregroundColor(.gray)
                                        .padding(.top, 5)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    }
                    .padding()
                }
                .background(Color.black)
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    CustomTabView()
}
