//
//  ConsignorListResponse.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 21/02/24.
//

import Foundation

struct ConsignorListRespone: Decodable {
    let data: [ConsignorDataModel]
    let message: String
    let status: Bool
}
