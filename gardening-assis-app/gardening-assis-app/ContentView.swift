//
//  ContentView.swift
//  gardening-assis-app
//
//  Created by kavindu madushan on 2023-04-02.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
        @State private var password = ""
        @State private var wrongUsername = 0
        @State private var wrongPassword = 0
        @State private var showingLoginScreen = false
        @State private var showingLoginScreen2 = false
        
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
                        Spacer()
                        Image("homepage")
                            .resizable()
                            .frame(width: 340, height: 280)
                        Spacer()
                        Button("Get Started"){
                            showingLoginScreen = true
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(30)
                        NavigationLink(destination: login().navigationBarBackButtonHidden(true), isActive: $showingLoginScreen){
                            EmptyView()
                        }
                        Spacer()
                        HStack{
                            Text("New around here?")
                            Text("Sign in")
                                .foregroundColor(Color.green)
                            NavigationLink(destination: login(), isActive: $showingLoginScreen){
                                EmptyView()
                            }
                        }
                        Spacer()
                    }
                }
                
            }
        }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
