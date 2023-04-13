//
//  signup.swift
//  gardening-assis-app
//
//  Created by kavindu madushan on 2023-04-02.
//

import SwiftUI

struct signup: View {
        @State private var username = ""
        @State private var password = ""
        @State private var wrongUsername = 0
        @State private var wrongPassword = 0
        @State private var showingLoginScreen = false
        
        var body: some View {
            NavigationView {
                ZStack {
                    Color.green
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.9)
                        .foregroundColor(.white.opacity(0.5))
                    Circle()
                        .scale(1.65)
                        .foregroundColor(.white)
                    VStack{
                        Image("pngwingcom")
                            .resizable()
                            .frame(width: 200, height: 300)
                        Text("Sign up")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .foregroundColor(.green)
                        TextField("Username", text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        
                        Button("Login"){
                            showingLoginScreen = true
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                        
                        NavigationLink(destination: login(), isActive: $showingLoginScreen){
                            EmptyView()
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
}

struct signup_Previews: PreviewProvider {
    static var previews: some View {
        signup()
    }
}
