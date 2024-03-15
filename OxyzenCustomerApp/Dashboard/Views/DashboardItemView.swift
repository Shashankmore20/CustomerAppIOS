//
//  DashboardItemView.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 09/03/24.
//

import Foundation
import SwiftUI

struct DashboardItemView: View {
    let item: item
    
    var body: some View {
        
        GeometryReader { reader in
            VStack(spacing: 5) {
                Text(item.title)
                    .font(.custom("Poppins-Medium", size: 13))
                    .foregroundColor(.black)
                    .bold()
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                
                Spacer()
                HStack{
                    Image(item.image)
                        .resizable()
                        .frame(width: item.width, height: item.height)
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                        .padding(.bottom, item.padding)
                    
                    Spacer()
                    
                    Image("arrow_icon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 17, height: 15)
                        .foregroundColor(Color("ArrowColor"))
                        .padding(.horizontal, 10)
                        .padding(.top, 10)
                }
                .padding(.bottom, 5)
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color("CustomWhite"), Color("CustomWhiteTransparent")]), startPoint: .top, endPoint:    .bottom
            ))
        }
        .frame(height: 130)
    }
}

struct DashboardItemView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardItemView(item: item(title: "hello", image: "consignorIcon", width: 50, height: 50, padding: 20))
    }
}
