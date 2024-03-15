//
//  consignorContacts.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 21/02/24.
//

import Foundation

struct consignorContacts: Decodable {
    let id: Int?
    let consignorId: Int?
    let contactName: String?
    let contactNumber: String?
    let email: String?
    let department: String?
    let designation: String?
    let createdTimestamp: String?
    let activeFlag: Int?
    let updatedTimestamp: String?

}
