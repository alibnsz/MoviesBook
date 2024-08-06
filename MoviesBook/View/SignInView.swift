//
//  SignInView.swift
//  MoviesBook
//
//  Created by Mehmet Ali Bunsuz on 24.07.2024.
//

import SwiftUI

struct SignInView: View {
    
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showForgotPasswordSheet: Bool = false
    @State private var isTabViewActive: Bool = false
    @State private var isSingUpViewActive: Bool = false

    var body: some View {
        ZStack {
            Image("signInBackround")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                HStack {
                        
                    Button("Skip") {
                        isTabViewActive = true
                    }
                    .foregroundColor(.gray.opacity(0.5))
                    
                }
                Spacer()
                VStack(spacing: 20) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                    
                    CustomTextField(hint: "Username", value: $emailID)
                    
                    CustomTextField(hint: "Password", isPassword: true, value: $password)
                    
                    HStack {
                        Spacer()
                        Button("Forgot Password") {
                            showForgotPasswordSheet.toggle()
                        }
                        .foregroundColor(.white)
                        .padding(.trailing)
                    }
                    
                    Button(action: {
                        isTabViewActive = true
                    }) {
                        Text("Sign In")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(17)
                            .background(Color.red)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal,10)
                    
                    Button(action: {
                        // Sign in with Apple action
                    }) {
                        HStack {
                            Image(systemName: "apple.logo")
                                .foregroundColor(.black)
                            Text("Sign in with Apple")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(17)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                    .padding(.horizontal,10)
                    
                    Button(action: {
                        // Sign in with Google action
                    }) {
                        HStack {
                            Image("google.svg")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("Sign in with Google")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(17)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                    .padding(.horizontal,10)
                }
                .padding()
                
                Spacer()
                HStack {
                    Text("Don’t you have an account?")
                        .foregroundColor(.gray)
                    Button(action: {
                        isSingUpViewActive = true
                    }) {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 30)
            }
            .padding(.horizontal)
        }
        .fullScreenCover(isPresented: $isSingUpViewActive) {
            SignUpView()
        }
        .fullScreenCover(isPresented: $isTabViewActive) {
            CustomTabView()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
