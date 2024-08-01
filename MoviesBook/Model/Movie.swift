//
//  Movie.swift
//  MoviesBook
//
//  Created by Mehmet Ali Bunsuz on 23.07.2024.
//

import Foundation

struct Movies: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

struct Rating: Codable {
    let source: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}

struct ComingMovies: Codable {
    let movie: [Movies]
    
    enum CodingKeys: String, CodingKey {
        case movie = "Search"
    }
}

