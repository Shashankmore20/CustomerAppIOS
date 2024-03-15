//
//  LoginScreenButtons.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 15/02/24.
//

import SwiftUI

struct LoginScreenButtons: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.custom("Poppins-Medium", size: 16))
            .foregroundColor(.white)
            .frame(maxWidth: 450, maxHeight: 50)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: 0xE68F2927)))
            .padding(.bottom, 5)
    }
}

struct LoginScreenButtons_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenButtons(title: "Test Title")
    }
}
