//
//  OxyzenCustomerAppApp.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 15/02/24.
//

import SwiftUI

@main
struct OxyzenCustomerAppApp: App {
    let persistenceController = PersistenceController.shared
    @EnvironmentObject var auth: Auth

    var body: some Scene {
        WindowGroup {
            SplashScreen()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(Auth.shared)
        }
    }
}
