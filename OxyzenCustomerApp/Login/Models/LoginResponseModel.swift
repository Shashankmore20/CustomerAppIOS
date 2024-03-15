//
//  LoginResponseModel.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 15/02/24.
//

import Foundation

struct LoginResponseModel: Decodable {
    let data: LoginResponseDataModel
    let message: String
    let status: Bool
    let token: String
}
