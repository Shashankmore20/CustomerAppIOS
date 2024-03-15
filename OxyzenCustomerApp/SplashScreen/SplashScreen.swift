//
//  SplashScreen.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 20/02/24.
//

import SwiftUI

struct SplashScreen: View {
    
//    @EnvironmentObject var authState: AuthState
    @EnvironmentObject var auth: Auth
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        if isActive {
            if auth.loggedIn {
                DashboardTabView()
            } else {
                LoginScreen()
            }
        }
        else {
            VStack{
                VStack{
                    Image("OxyzenLogoFull")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(70)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.5)){
                        self.size = 1.12
                        self.opacity = 1.0
                    }
                }
            }
            .preferredColorScheme(.light)
            .background(Color.white)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                    self.isActive = true
                }
            }
            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
            .environmentObject(Auth.shared)
    }
}
