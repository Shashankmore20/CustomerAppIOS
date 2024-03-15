//
//  LoginModel.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 15/02/24.
//

import Foundation
import UIKit

struct LoginModel: Encodable {
    let userName: String
    let password: String
    let appVersion: Int = 1
    let imei: String = UIDevice.current.identifierForVendor?.uuidString ?? ""
}
