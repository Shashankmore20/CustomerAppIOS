//
//  ViewConsignees.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 07/03/24.
//

import SwiftUI

struct ViewConsignees: View {
    
    @Environment(\.presentationMode) var presentationMode
    let apiManager = ApiManager.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    Color.white.edgesIgnoringSafeArea(.all)
                    Text("Hello, From Consignees!")
                }
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
                        Text("Consignees")
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
            apiManager.getConsignees { result in
                switch result {
                case .success(let consigneeResponse):
                    // Handle success, update your view model or other data accordingly
                    print(consigneeResponse.message)
                case .failure(let error):
                    // Handle failure, display an error message or take appropriate action
                    print("Error fetching consignees: \(error)")
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)
        .background(Color.white)
    }
}

struct ViewConsignees_Previews: PreviewProvider {
    static var previews: some View {
        ViewConsignees()
    }
}
