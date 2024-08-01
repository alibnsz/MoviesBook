//
//  SignUpView.swift
//  MoviesBook
//
//  Created by Mehmet Ali Bunsuz on 26.07.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showForgotPasswordSheet: Bool = false
    @State private var isSingInViewActive: Bool = false
    
    var body: some View {
        ZStack {
            Image("signInBackround")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack(spacing: 50) {
                    VStack(spacing: 10) {
                        Spacer()
                        Image(systemName: "person.fill.badge.plus")
                            .resizable()
                            .frame(width: 85, height: 85)
                            .foregroundColor(.gray)
                        Spacer()
                        VStack{
                            CustomTextField(hint: "name..", value: $name)
                            CustomTextField(hint: "surname..", value: $surname)
                            CustomTextField(hint: "email..", value: $emailID)
                            CustomTextField(hint: "password..", isPassword: true, value: $password)
                            CustomTextField(hint: "password again..", isPassword: true, value: $confirmPassword)
                        }
                    }
                    
                    Button(action: {
                        // Perform sign up action
                        
                    }) {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(Color.red)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal,10)

                }
                .padding()
                
                Spacer()
                HStack {
                    Text("Do you already have an account?")
                        .foregroundColor(.gray)
                    Button(action: {
                        isSingInViewActive = true
                    }) {
                        Text("Sign In")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .fullScreenCover(isPresented: $isSingInViewActive) {
            SignInView()
        }
    }
}


#Preview {
    SignUpView()
}

