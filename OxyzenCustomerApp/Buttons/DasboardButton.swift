//
//  DasboardButton.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 07/03/24.
//

import SwiftUI

struct DasboardButton: View {
    
    var title: String
    var image: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(.black)
                .padding(.top, 10)
                .bold()
            
            Spacer()
            
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .padding(.leading, 10)
                    .padding(.bottom, 5)
                
                Spacer()
                
                Image("arrow_icon")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color("ArrowColor"))
            }
            .padding(.bottom, 5)
        }
        .shadow(color: Color.black.opacity(0.5), radius: 40, y: 5)
        .padding()
        .frame(maxWidth: 140, maxHeight: 140)
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color("CustomWhite"), Color("CustomWhiteTransparent")]), startPoint: .top, endPoint: .bottom
                    )
                )
        )
        .padding(.bottom, 5)
    }
}

struct DasboardButton_Previews: PreviewProvider {
    static var previews: some View {
        DasboardButton(title: "Test Title", image: "consignorIcon")
    }
}
