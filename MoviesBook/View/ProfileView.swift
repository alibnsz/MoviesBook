//
//  ProfileView.swift
//  MoviesBook
//
//  Created by Mehmet Ali Bunsuz on 29.07.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isOnboardingActive = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            HStack {
                Spacer()
                Text("Profile")
                    .foregroundColor(.white)
                    .font(.title2)
                Spacer()
                Button(action: {
                    isOnboardingActive  = true
                }) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .foregroundColor(.white)
                }
            }
            .padding()

            VStack(spacing: 10) {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.red, lineWidth: 2))
                Text("Mehmet Ali")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                Text("ali@gmail.com")

            }
            .padding(.top, 20)
            Button(action: {
                // Sign In action
            }) {
                Text("Edit Profile")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(17)
                    .background(Color.red)
                    .foregroundColor(.black)
                    .cornerRadius(20)
            }
            .padding(.horizontal,50)

            // Options List
            VStack(spacing: 15) {
                OptionRow(icon: "gear", title: "Settings")
                OptionRow(icon: "gear", title: "Settings")
                OptionRow(icon: "gear", title: "Settings")
                OptionRow(icon: "info.circle", title: "Information")
                
            }
            .padding(.top, 20)

            Spacer()
        }
        .fullScreenCover(isPresented: $isOnboardingActive) {
            OnboardingView()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct OptionRow: View {
    var icon: String
    var title: String

    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                Text(title)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            })
        }
        .fontWeight(.bold)
        .frame(maxWidth: .infinity)
        .padding(17)
        .background(Color.gray.opacity(0.3))
        .foregroundColor(.black)
        .cornerRadius(20)
        .padding(.horizontal,50)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
