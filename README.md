# OMDb API Application

This is a SwiftUI-based application that fetches and displays movie information using the [OMDb API](https://www.omdbapi.com). The project is structured with the MVVM architecture and uses native networking with `URLSession`.

## Screenshots
<img width=1600 src="https://github.com/user-attachments/assets/5ee6e3eb-8c2f-4727-9cc4-a4ae31b9c487"/>

## Features

- **Search Movies and TV Shows**: Search for movies or TV shows by name.
- **Detailed Information**: View detailed information about a specific movie or show, including the synopsis, release date, cast, and ratings.
- **Discover Popular Content**: Browse trending and popular movies or TV shows.
- **Personalized Lists**: Create and manage watchlists or favorites.

## Getting Started

### Prerequisites

- [OMDb API Key]([https://www.omdbapi.com/apikey.aspx]): Sign up and generate an API key.
- A Mac with Xcode installed to run and test the application.

### Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/your-username/omdb-api-app.git
   cd omdb-api-app

   ```

2. Open the project in Xcode.

3. Create a `DownloaderClient.swift` file in the project and add your TMDb API key:

   ```swift
   let apiKey = "your_api_key_here"
   ```

4. Build and run the application:

   - Select your simulator or connected device in Xcode.
   - Press `Cmd + R` to build and run the app.

## Architecture

This project follows the **MVVM (Model-View-ViewModel)** architecture pattern:

- **Model**: Represents the data and business logic.
- **View**: SwiftUI views that display the data.
- **ViewModel**: Handles the business logic and provides data to the views.

### Dependency Injection

- The services and view models are distributed using a **Factory** pattern, ensuring a single responsibility and reusability across the app.

## Caching

The app includes a lightweight caching mechanism to store and retrieve frequently used data, improving performance and reducing network calls.

## Technologies Used

- **Language**: Swift
- **UI Framework**: SwiftUI
- **Architecture**: MVVM
- **Network**: URLSession
- **Caching**: Custom in-memory caching solution (no third-party libraries used).

## Usage

1. **Search for Movies/TV Shows**:

   - Enter the name of a movie or TV show in the search bar.
   - View a list of matching results with brief details.

2. **View Detailed Information**:

   - Tap on any movie or show to view its detailed information, including:
     - Title
     - Overview
     - Ratings

3. **Discover Popular Content**:

   - Visit the "Trending" section to explore currently popular movies and TV shows.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add a new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Open a pull request.

## Acknowledgments

- [TMDb](https://www.omdbapi.com) for the API.
- The SwiftUI community for inspiration and best practices.
