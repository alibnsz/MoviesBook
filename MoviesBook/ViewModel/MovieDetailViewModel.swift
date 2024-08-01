import SwiftUI

class MovieDetailViewModel: ObservableObject {
    @Published var movieDetail: MoviesDetailsViewModel?

    let downloaderClient = DownloaderClient()

    func getMovieDetail(imdbID: String) {
        downloaderClient.movieDetailDownload(imdbID: imdbID) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let detailMovie):
                DispatchQueue.main.async {
                    self.movieDetail = MoviesDetailsViewModel(detail: detailMovie)
                }
            }
        }
    }
}

struct MoviesDetailsViewModel {
    let detail: DetailModel

    var title: String {
        detail.title
    }
    var poster: String {
        detail.poster
    }
    var year: String {
        detail.year
    }
    var imdbID: String {
        detail.imdbID
    }
    var plot: String {
        detail.plot
    }
    var genre: String {
        detail.genre
    }
    var director: String {
        detail.director
    }
    var imdbRating: String {
        detail.imdbRating
    }
    var metaScore: String {
        detail.metascore
    }
    var actors: String {
        detail.actors
    }
    var runtime: String {
        detail.runtime
    }
}
