//
//  SideMenuRowView.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 27/02/24.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    @Binding var selectedOption: SideMenuOptionModel?
    
    private var isSelected: Bool {
        return selectedOption == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.medium)
                .padding(.leading, 13)
                .foregroundColor(.black)
            
            Text (option.title)
                .font(.subheadline)
                .bold()
                .foregroundColor(.black)
                .frame(maxWidth: 170)
            
            Image(systemName: "arrow.forward.circle.fill")
                .imageScale(.medium)
                .foregroundColor(Color(hex: 0xE68F2927))
            Spacer()
        }
        .frame(height: 44)
        .background(Color(hex: 0xF3F5FB))
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(option: .MyPaymnets, selectedOption: .constant(.Home))
    }
}
