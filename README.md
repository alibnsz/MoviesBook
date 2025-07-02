# 🎬 MoviesBook

<div align="center">
  <img src="https://github.com/user-attachments/assets/b9db1889-043d-4fb5-93b5-2263b387278d" alt="MoviesBook Logo" width="256" height="256">
  <h3>Redefine your movie discovery and favoriting experience</h3>
</div>

---

## 📱 App Screenshots

<div align="center">
  <img src="https://github.com/user-attachments/assets/5ee6e3eb-8c2f-4727-9cc4-a4ae31b9c487" alt="App Screenshots" width="800">
</div>

---

## 📖 About the Project

**MoviesBook** is a modern iOS application that allows users to explore a vast movie archive, access detailed information, and organize their favorite movies. It provides access to current movie data through OMDB API integration and offers a secure user experience with Firebase infrastructure.

## ✨ Features

- 🔍 **Advanced Movie Search**: Search through comprehensive movie database with OMDB API
- 📋 **Detailed Movie Information**: Poster, plot, cast, director, and rating information
- ❤️ **Favorites Management**: Add your favorite movies to your collection
- 👤 **User Profile**: Personalized experience
- 🔐 **Secure Authentication**: Secure session management with Firebase Authentication
- 🌙 **Dark Mode**: Modern and elegant dark theme
- 📱 **Responsive Design**: Optimal experience on all iPhone models

## 🏗 Architecture

This project is developed using **MVVM (Model-View-ViewModel)** architecture. The project consists of four main layers:

- **Model**: Movie data and API response models
- **View**: User interfaces built with SwiftUI
- **ViewModel**: Business logic and data management
- **Service**: API calls and network operations

## 🛠 Technologies

- **Framework**: SwiftUI
- **Architecture**: MVVM Pattern
- **Networking**: URLSession
- **Backend**: Firebase (Auth, Firestore, Storage)
- **API**: OMDB API
- **Dependency Management**: CocoaPods
- **Minimum iOS**: 14.0+

## 📦 Dependencies

- **FirebaseAuth**: User authentication
- **FirebaseFirestore**: NoSQL database
- **FirebaseStorage**: File storage

## 🚀 Installation

1. **Clone the project** and navigate to the directory
2. **Install CocoaPods dependencies** - Run `pod install` command in Terminal
3. **Open workspace file** - Open `MoviesBook.xcworkspace` file with Xcode
4. **Firebase configuration**
   - Create a new project in Firebase Console
   - Add iOS application
   - Add GoogleService-Info.plist file to the project
5. **OMDB API Key**
   - Get a free API key from [OMDB API](https://www.omdbapi.com/)
   - Update your API key in DownloaderClient.swift file

## 🎯 Usage

1. **Onboarding**: Welcome screen is displayed when the app opens
2. **Sign In/Sign Up**: Secure authentication with Firebase Auth
3. **Search**: You can search by movie name on the main screen
4. **Details**: Tap on movie posters to access detailed information
5. **Favorites**: Add your favorite movies to favorites list

## 🔧 Customization

- **API Endpoint Change**: You can update the URL in DownloaderClient.swift file
- **Theme Customization**: You can change the preferredColorScheme setting in MoviesBookApp.swift file

