//
//  SideMenuHeaderView.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 27/02/24.
//

import SwiftUI

struct SideMenuHeaderView: View {
    
    @State private var customerCode: String = SqlCoreData.shared.getStoredCustCode()!
    @State private var customerName: String = SqlCoreData.shared.getStoredCustName()!

    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 70, height: 70)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("\(customerName)")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.black)
                Text("\(customerCode)")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(Color(hex: 0xE68F2927))
            }
            Spacer()
        }
        .background(Color(hex: 0xF3F5FB))
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView()
    }
}
