//
//  ConsigneeDataModel.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 07/03/24.
//

import Foundation

struct ConsigneeDataModel: Decodable {
    let id: Int?
    let customerId: Int?
    let custCode: String?
    let isActive: Bool
    let city: String?
    let stateCode: String?
    let olCode: String?
    let address1: String?
    let address2: String?
    let address3: String?
    let nearbyLandmark: String?
    let consigneeCode: String?
    let consigneeName: String?
    let phoneNum: String?
    let email: String?
    let gstin: String?
    let pan: String?
    let contactName: String?
    let contactEmail: String?
    let contactPhone: String?
    let pincode: Int
    let createdBy: Int?
    let updatedBy: Int?
    let createdTimestamp: String?
    let updatedTimestamp: String?
    let statusTxt: String?
    let wxConsigneeCode: String?
    let isEditable: Bool
    let isConsignor: Int?
    let contactPhoneno: String?
    let consigneeOlCode: String?
    let consigneePhoneNo: String?
    let consigneeId: Int?
    let state:String?
    let dealerCode:String?
    
}
