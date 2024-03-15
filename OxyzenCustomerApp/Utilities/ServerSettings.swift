//
//  ServerSettings.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 07/03/24.
//

import Foundation
import SwiftUI

class ServerSettings: ObservableObject {
    @Published var selectedServer: String = BASE_SERVER_URL

    func setServer(_ serverURL: String) {
        selectedServer = serverURL
    }
}
