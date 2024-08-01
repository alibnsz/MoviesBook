//
//  DownloaderClient.swift
//  MoviesBook
//
//  Created by Mehmet Ali Bunsuz on 24.07.2024.
//

import Foundation

class DownloaderClient {
    func moviesDownload(search: String, completion: @escaping (Result<[Movies]?, DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=e075d415") else {
            return completion(.failure(.vrongUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.dataDidNotArrive))
            }
            do {
                // JSON verisini kontrol edin
                if String(data: data, encoding: .utf8) != nil {
                    //print("Received JSON: \(jsonString)")
                }
                let moviesResponse = try JSONDecoder().decode(ComingMovies.self, from: data)
                completion(.success(moviesResponse.movie))
            } catch {
                completion(.failure(.dataCouldNotBeProcessed))
            }
        }.resume()
    }
    func movieDetailDownload(imdbID: String, completion: @escaping (Result<DetailModel, DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=e075d415") else {
            return completion(.failure(.vrongUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.dataDidNotArrive))
            }
            do {
                // JSON verisini kontrol edin
                if String(data: data, encoding: .utf8) != nil {
                    //print("Received JSON: \(jsonString)")
                }
                let moviesResponseDetail = try JSONDecoder().decode(DetailModel.self, from: data)
                completion(.success(moviesResponseDetail))
            } catch {
                completion(.failure(.dataCouldNotBeProcessed))
            }
        }.resume()
    }
}


    
    

enum DownloaderError: Error {
    
    case vrongUrl
    case dataDidNotArrive
    case dataCouldNotBeProcessed
}
