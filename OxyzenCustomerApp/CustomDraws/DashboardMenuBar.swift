//
//  DashboardMenuBar.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 23/02/24.
//

import SwiftUI

struct DashboardMenuBar: View {
    @State private var showMenu = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello World")
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                }
            }
            .padding()
        }
    }
}

struct DashboardMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        DashboardMenuBar()
    }
}
