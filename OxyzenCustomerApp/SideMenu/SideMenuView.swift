//
//  SideMenuView.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 27/02/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @Binding var selectedTab: Int
    @State private var selectedOption: SideMenuOptionModel?
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isShowing.toggle() }
                
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        SideMenuHeaderView()
                        
                        ScrollView{
                            VStack {
                                ForEach(SideMenuOptionModel.allCases) { option in
                                    Button {
                                        onOptionTapped(option)
                                    } label: {
                                        SideMenuRowView(option: option, selectedOption: $selectedOption)
                                    }

                                }
                            }
                        }
                    }
                    .frame(width: 270, alignment: .leading)
                    .background(.white)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
    
    private func onOptionTapped(_ option: SideMenuOptionModel) {
        selectedOption = option
        selectedTab = option.rawValue
        if option == .LogOut {
            option.performAction()
        }
        
        isShowing = false
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true), selectedTab: .constant(0))
    }
}
