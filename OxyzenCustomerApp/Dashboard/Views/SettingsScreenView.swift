//
//  SettingsScreenView.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 16/02/24.
//

import SwiftUI

struct SettingsScreenView: View {
    
    @State private var navigateToLogin = false
    @State private var showMenu = false
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    Text("Hello from Settings")
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {
                        Auth.shared.logout()
                        navigateToLogin = true
                    }) {
                        LoginScreenButtons(title: "Log Out")
                    }
                    .padding(.horizontal, 10)
                    .background(
                        NavigationLink(destination: LoginScreen(), isActive: $navigateToLogin) {
                            EmptyView()
                        }
                            .hidden()
                    )
                    Spacer()
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
        .preferredColorScheme(.light)
        .background(Color.white)
    }
}

struct SettingsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreenView()
    }
}
