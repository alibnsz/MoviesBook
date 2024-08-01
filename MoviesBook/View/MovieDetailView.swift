import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel = MovieDetailViewModel()
    var imdbID: String

    var body: some View {
        ScrollView {
            VStack {
                // Movie Poster
                if let posterURL = URL(string: viewModel.movieDetail?.poster ?? "") {
                    AsyncImage(url: posterURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(12)
                            .padding()
                    } placeholder: {
                        Color.gray
                            .frame(maxWidth: .infinity)
                    }
                } else {
                    Color.gray
                        .frame(maxWidth: .infinity)
                }

                if let movieDetail = viewModel.movieDetail {
                    Text(movieDetail.title)
                        .font(.custom("Impact", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()

                    Text("Year: \(movieDetail.year)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)

                    Text("Plot: \(movieDetail.plot)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)

                    Text("Genre: \(movieDetail.genre)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)

                    Text("Director: \(movieDetail.director)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    Text("Director: \(movieDetail.actors)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    Text("Run Time: \(movieDetail.runtime)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)

                    Text("IMDB Rating: \(movieDetail.imdbRating)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)

                    Text("Metascore: \(movieDetail.metaScore)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                } else {
                    Text("Loading...")
                        .foregroundColor(.gray)
                }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
            .padding()
        }
        .navigationTitle(viewModel.movieDetail?.title ?? "Movie Detail")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getMovieDetail(imdbID: imdbID)
        }
    }
}

#Preview {
    CustomTabView()
}
