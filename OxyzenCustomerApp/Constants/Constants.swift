//
//  Constants.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 15/02/24.
//

import Foundation

let BASE_SERVER_URL = "http://43.205.199.91:8080/owens/"
let TEST_SERVER_URL = "http://104.237.9.226:8080/oxyzen/"
let PROD_SERVER_URL = "https://www.oxyzenexpress.com/oxyzen/"

let selected_server = BASE_SERVER_URL

let Login_URL = "\(selected_server)api/auth/login"
let Login_With_Otp_URL = "\(selected_server)api/auth/validate/otp"
let GET_CONSIGNORS_URL = "\(selected_server)api/masters/consignor"
let GET_CONSIGNEES_URL = "\(selected_server)api/masters/consignee"
