//
//  ConsignorDataModel.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 21/02/24.
//

import Foundation

struct ConsignorDataModel: Decodable {
    let id: Int?
    let olCode: String?
    let address1: String?
    let address2: String?
    let branchCode: String?
    let city: String?
    let consignorCode: String?
    let consignorId: Int?
    let consignorName: String?
    let consignorSubCode: String?
    let consignorPincode: Int?
    let contactEmail: String?
    let contactName: String?
    let contactPhoneno: String?
    let contractCustomer: Bool?
    let custCode: String?
    let customerId: Int?
    let email: String?
    let gstin: String?
    let mobileno: String?
    let pan: String?
    let stateCode: String?
    let state: String?
    let phoneNum: String?
    let nearbyLandmark: String?
    let contactPhone: String?
    let pincode: Int?
    let isTbb: Bool?
    let cftFactor: Int?
    let contacts: [consignorContacts]
}
