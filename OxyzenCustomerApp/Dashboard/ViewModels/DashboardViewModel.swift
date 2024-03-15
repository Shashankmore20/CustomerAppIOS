//
//  DashboardViewModel.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 09/03/24.
//

import Foundation
import SwiftUI

class DashboardViewModel: ObservableObject {
    //This is for the BarChart Values
    @Published var datas: [Data] = [
        .init(name: "Delivered", value: 38),
        .init(name: "In Transit", value: 4),
        .init(name: "Delayed", value: 2)
    ]
    //This is for the BarChart Values
    struct Data {
        let name: String
        let value: Int
    }
}

struct DashboardItemViewModel {
//    let id: UUID()
    let title: String
    let image: String
    let width: CGFloat
    let height: CGFloat
    let padding: CGFloat
}

class DashboardItemViewViewModel {
    let item: DashboardItemViewModel
    
    init(item: DashboardItemViewModel) {
        self.item = item
    }
}
