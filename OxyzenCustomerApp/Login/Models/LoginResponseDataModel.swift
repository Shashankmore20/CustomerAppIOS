//
//  LoginResponseDataModel.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 15/02/24.
//

import Foundation

struct LoginResponseDataModel: Decodable{
    let id: Int
    let emailId: String
    let olCode: String
    let otpReq: Bool
    let userType: String
    let refId: Int
    let custId: Int
    let consignorId: Int?
    let refname: String
    let imei: String?
    let custCode: String
    let consignorCode: String?
    let authorities: [String]
    let olCodes: [String]
    let accountNonExpired: Bool
    let accountNonLocked: Bool
    let credentialsNonExpired: Bool
    let enabled: Bool
    let username: String
}
