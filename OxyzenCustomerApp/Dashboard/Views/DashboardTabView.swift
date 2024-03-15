//
//  DashboardTabView.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 16/02/24.
//

import SwiftUI

struct DashboardTabView: View {
    
    @EnvironmentObject var auth: Auth
    @State private var navigateToLogin = false
    @State private var selectedTabb : Tab = .house
    @State private var showMenu = false
    @State private var selectedTab = 0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    TabView(selection: $selectedTabb)    {
                        DashboardScreenView()
                            .tag(Tab.house)
                        SettingsScreenView()
                            .tag(Tab.gear)
                    }
                }
                .overlay(
                    VStack {
                        Spacer()
                            CustomTabBar(selectedTab: $selectedTabb)
                    }
                        .ignoresSafeArea(edges: .bottom)
                )
                
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .onAppear {
                UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
                UINavigationBar.appearance().backgroundColor = UIColor.gray // Set the desired background color
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(appState.isNavigationLinkActive)  // Corrected line
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(Color.black)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Spacer(minLength: 30)
                        Image("oxylogo_nobg")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black) // Set the color as needed
                            .font(.title) // Adjust the font size if necessary
                            .frame(width: 200, height: 38) // Adjust the frame size
                    }
                    .padding(.bottom, 10)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
//                        showMenu.toggle()
                    } label: {
                        Image(systemName: "bell.fill")
                            .foregroundColor(Color.black)
                    }
                }
            }
        }
        .preferredColorScheme(.light)
        .onAppear {
            if !auth.loggedIn {
                selectedTabb = .house
            }
        }
    }
}

struct DashboardTabView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
            .environmentObject(Auth.shared)
    }
}
