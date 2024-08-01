//
//  OnBoardingView.swift
//  MoviesBook
//
//  Created by Mehmet Ali Bunsuz on 24.07.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isTabViewActive = false
    @State private var isSignUpViewActive = false
    
    var body: some View {
        ZStack {
            Image("onboarding")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()

                
                VStack() {
                    Button(action: {
                        isSignUpViewActive = true
                    }) {
                        Text("Sign In")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(18)
                            .background(Color.red.opacity(0.8))
                            .foregroundColor(.black)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal,25)

                    .fullScreenCover(isPresented: $isSignUpViewActive) {
                        SignInView()
                    }
                    
                    Button(action: {
                        isTabViewActive = true
                    }) {
                        Text("Skip")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(18)
                            .background(Color.clear)
                            .foregroundColor(.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.red, lineWidth: 1)
                            )
                            .padding(.horizontal,25)

                    }
                    .fullScreenCover(isPresented: $isTabViewActive) {
                        CustomTabView()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 50)
            }
        }
    }
}
#Preview {
    OnboardingView()
}
