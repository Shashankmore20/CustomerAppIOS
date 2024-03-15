//
//  ViewConsignors.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 07/03/24.
//

import SwiftUI

struct ConsignorCard: View {
    
    var body: some View {
        VStack {
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    Text("Name of the Consignor ejgerh ewhgiew")
                        .font(.custom("Poppins-Medium", size: 16))
                        .bold()
                        .lineLimit(1)
                        .foregroundColor(.black)
                }
                Spacer()
                Text("View")
                    .font(.custom("Poppins", size: 16))
                    .bold()
                    .padding(.leading, 50)
                    .padding(.trailing, 20)
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 1)
            
            HStack {
                Text("GST: ")
                    .font(.custom("Poppins", size: 16))
                    .foregroundColor(.black)
                Spacer()
                HStack {
                    Image(systemName: "phone.fill")
                    
                    Text("7093111225")
                        .font(.custom("Poppins", size: 16))
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 1)
            
            HStack {
                HStack {
                    Image(systemName: "location.fill")
                    
                    Text("Location")
                        .font(.custom("Poppins", size: 16))
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Pincode: 500026")
                    .font(.custom("Poppins", size: 16))
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 10)
        }
        //                    .frame(width: 300, height: 120)
        .shadow(color: Color.black.opacity(0.5), radius: 40, y: 5)
        .background(RoundedRectangle(cornerRadius: 10) .fill(
            LinearGradient(gradient: Gradient(colors: [Color("CustomWhite"),Color("CustomWhiteTransparent")]), startPoint: .top, endPoint: .bottom
                          )
        ))
    }
}

struct ViewConsignors: View {
    
    @Environment(\.presentationMode) var presentationMode
    let apiManager = ApiManager.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                List(0 ..< 500) { item in
                    ConsignorCard()
                }
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
            }
            .onAppear {
                UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
                UINavigationBar.appearance().backgroundColor = UIColor.gray // Set the desired background color
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(Color.black)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Spacer(minLength: 30)
                        Text("Consignors")
                            .foregroundColor(.black) // Set the color as needed
                            .font(.custom("Poppins-SemiBold", size: 20))
                            .padding(.leading, 50)
                    }
                    .padding(.top, 5)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("oxy_logo_nobg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
            }
        }
        .onAppear {
            apiManager.getConsignors { result in
                switch result {
                case .success(let consignorResponse):
                    // Handle success, update your view model or other data accordingly
                    print(consignorResponse.message)
                case .failure(let error):
                    // Handle failure, display an error message or take appropriate action
                    print("Error fetching consignors: \(error)")
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)
        .background(Color.white)
    }
}

struct ViewConsignors_Previews: PreviewProvider {
    static var previews: some View {
        ViewConsignors()
    }
}
