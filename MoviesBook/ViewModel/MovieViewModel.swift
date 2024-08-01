//
//  MovieViewModel.swift
//  MoviesBook
//
//  Created by Mehmet Ali Bunsuz on 24.07.2024.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    @Published var staticMovies = [
        MovieViewModel(movie: Movies(title: "Oppenheimer", year: "2023", imdbID: "tt15398776", type: "movie", poster: "https://creativereview.imgix.net/content/uploads/2023/12/Oppenheimer.jpg?auto=compress,format&q=60&w=1263&h=")),
        MovieViewModel(movie: Movies(title: "Dune: Part Two", year: "2024", imdbID: "tt15239678", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BN2QyZGU4ZDctOWMzMy00NTc5LThlOGQtODhmNDI1NmY5YzAwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SX300.jpg")),
        MovieViewModel(movie: Movies(title: "Parasite", year: "2019", imdbID: "tt6751668", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_SX300.jpg")),
        MovieViewModel(movie: Movies(title: "The Matrix Resurrections", year: "2021", imdbID: "tt10838180", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BMGJkNDJlZWUtOGM1Ny00YjNkLThiM2QtY2ZjMzQxMTIxNWNmXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SX300.jpg")),
        MovieViewModel(movie: Movies(title: "Léon: The Professional", year: "1994", imdbID: "tt0110413", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BOTgyMWQ0ZWUtN2Q2MS00NmY0LWI3OWMtNjFkMzZlNDZjNTk0XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg")),
        MovieViewModel(movie: Movies(title: "Titanic", year: "1997", imdbID: "tt0120338", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg"))

    ]
    
    let downloaderClient = DownloaderClient()
    
    func MovieSearch(movieName: String) {
        downloaderClient.moviesDownload(search: movieName) { (sonuc) in
            switch sonuc {
            case .failure(let error):
                print(error)
            case .success(let movieArray):
                if let movieArray = movieArray {
                    DispatchQueue.main.async {
                        self.movies = movieArray.map(MovieViewModel.init)
                        self.staticMovies = [] // API'den yeni filmler geldikten sonra sabit filmleri temizle
                    }
                }
            }
        }
    }
}

struct MovieViewModel {
    let movie: Movies
    
    var title: String {
        movie.title
    }
    var poster: String {
        movie.poster
    }
    var year: String {
        movie.year
    }
    var imdbID: String {
        movie.imdbID
    }
}


