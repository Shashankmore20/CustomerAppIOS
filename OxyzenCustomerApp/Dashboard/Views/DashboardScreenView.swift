//
//  DashboardScreenView.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 15/02/24.
//

import SwiftUI
import Charts


struct item: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let width: CGFloat
    let height: CGFloat
    let padding: CGFloat
    
}

struct DashboardScreenView: View {
    
    @ObservedObject var viewModel = DashboardViewModel()
    
    
    let items = [
        item(title: "Consignors", image: "consignorIcon", width: 45, height: 45, padding: 20),
        item(title: "Consignees", image: "consignee_icon", width: 45, height: 45, padding: 20),
        item(title: "Ready Reckoner", image: "network_ready_reckoner", width: 45, height: 45, padding: 10),
        item(title: "Add Pickup Orders", image: "add_pickups_icon", width: 45, height: 45, padding: 10),
        item(title: "My Pickup Orders", image: "icon_piece_management", width: 45, height: 45, padding: 10),
        item(title: "My Dockets", image: "my_dockets_icon", width: 45, height: 45, padding: 10),
        item(title: "Create E-Invoice", image: "invoice_icon", width: 45, height: 45, padding: 10),
        item(title: "Create E-Way Bill", image: "eway_bill_icon", width: 45, height: 45, padding: 10),
        item(title: "My OTPs", image: "my_otp_icon", width: 50, height: 50, padding: 10),
        item(title: "My Wallet", image: "my_wallet_icon", width: 45, height: 45, padding: 10),
        item(title: "Track Dockets", image: "track_docket_img", width: 45, height: 45, padding: 10),
    ]
    
    let spacing: CGFloat = 20
    
    
    @State private var numberofRows = 3
    @State private var isNavigationLinkActive = false
    
    let apiManager = ApiManager.shared
    
    var body: some View {
        
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing), count: numberofRows)
        
        NavigationStack {
            ZStack {
                ScrollView {
                    Color.white.ignoresSafeArea(.all)
                    VStack(alignment: .leading) {
                        Text("Docket Status")
                            .padding(.horizontal)
                        Chart(viewModel.datas, id: \.name) {data in
                            BarMark(
                                x: .value("Datas", data.value),
                                stacking: .normalized
                            )
                            .foregroundStyle(by: .value("Name", data.name))
                        }
                        .padding(.horizontal)
                        .frame(height: 48)
                        .chartXAxis(.hidden)
                        
                        LazyVGrid(columns: columns, spacing: spacing) {
                            ForEach(items) { item in
                                if destinationForItem(item) != nil{
                                    NavigationLink(destination: destinationForItem(item)){
                                        DashboardItemView(item: item)
                                    }
                                    .buttonStyle(ItemButtonStyle(corenerRadius: 20))
                                } else {
                                    DashboardItemView(item: item)
                                        .buttonStyle(ItemButtonStyle(corenerRadius: 20))
                                        .cornerRadius(20)
                                        .disabled(true)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 40)
                    }
                }
                .padding(.bottom, 40)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }
        }
        .preferredColorScheme(.light)
        .background(Color.white)
    }
    
    //Function for the Destination of the onClickItem
    private func destinationForItem(_ item: item) -> AnyView? {
        switch item.title {
        case "Consignors":
            return AnyView(ViewConsignors())
        case "Consignees":
            return AnyView(ViewConsignees())
        case "Ready Reckoner":
            return AnyView(ViewConsignors())
        case "Add Pickup Orders":
            return AnyView(ViewConsignors())
        case "My Pickup Orders":
            return AnyView(ViewConsignors())
        case "My Dockets":
            return AnyView(ViewConsignors())
        case "Create E-Invoice":
            return nil
        case "Create E-Way Bill":
            return nil
        case "My OTPs":
            return AnyView(ViewConsignors())
        case "My Wallet":
            return nil
        case "Track Dockets":
            return AnyView(ViewConsignors())
        default:
            return nil
        }
    }
}


// This is the code for the buttonStyle when clicked on
struct ItemButtonStyle: ButtonStyle {
        
    let corenerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
            
            if configuration.isPressed {
                Color.black.opacity(0.1)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: Color.black.opacity(0.2), radius: 5, y: 5)
    }
}


struct DashboardScreenView_Previews: PreviewProvider {
    static var previews: some View {
//        DashboardScreenView(appState: AppState())
        DashboardScreenView()
    }
}
