//
//  ConsigneeListResponse.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 07/03/24.
//

import Foundation

struct ConsigneeListResponse: Decodable {
    let data: [ConsigneeDataModel]
    let message: String
    let status: Bool
}
