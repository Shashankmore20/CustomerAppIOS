//
//  CustomTabBar.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 16/02/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case gear
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    struct TabItem {
        var tab: Tab
        var imageName: String
        var customText: String
    }
    
    private let tabItems: [TabItem] = [
        TabItem(tab: .house, imageName: "house", customText: "Home"),
        TabItem(tab: .gear, imageName: "gear", customText: "Settings")
    ]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(tabItems, id: \.tab.rawValue) { item in
                    Spacer()
                    VStack(spacing: 5) {
                        Image(systemName: selectedTab == item.tab ? "\(item.imageName)" : item.imageName)
                            .scaleEffect(selectedTab == item.tab ? 1.25 : 1.0)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(selectedTab == item.tab ? .black : .gray)
                        
                        Text(item.customText)
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(selectedTab == item.tab ? .black : .gray)
                            .scaleEffect(selectedTab == item.tab ? 1.25 : 1.0)
                    }
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)){
                            selectedTab = item.tab
                        }
                    }
                    Spacer()
                }
            }
            .frame(height: 70)
            .background(Color("TabBackground"))
            .cornerRadius(10)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
