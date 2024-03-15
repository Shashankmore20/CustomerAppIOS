//
//  ApiManager.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 15/02/24.
//

import Foundation
import Alamofire
import UIKit
import CoreData

class AuthState: ObservableObject {
    @Published var isLoggedIn: Bool = false
}

class ApiManager{
    
    let headers: HTTPHeaders = [.contentType("application/json")]
    static let shareInstance = ApiManager()
    static let shared = ApiManager()
    private init() {}
    
    //Function to login when no OTP is Required
    func LoginApi(login: LoginModel, completion: @escaping (Result<LoginResponseModel, AFError>) -> Void){
        AF.request(Login_URL, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).responseDecodable(of: LoginResponseModel.self) { response in
            print(Login_URL, login, self.headers)
            switch response.result{
            case.success(let loginResponse):
                // Handle successful response with your LoginResponseModel
                completion(.success(loginResponse))
                print(loginResponse.data.refId)
                print(loginResponse.data.custCode)
                
                SqlCoreData.shared.saveRefId(String(loginResponse.data.refId))
                SqlCoreData.shared.saveCustCode(loginResponse.data.custCode)
                SqlCoreData.shared.saveUserName(loginResponse.data.username)
                SqlCoreData.shared.saveCustomerName(loginResponse.data.refname)
                
                Auth.shared.setCredentials(accessToken: loginResponse.token)
                print(Auth.shared.getAccessToken()!)
                
                
                if let storedRef = SqlCoreData.shared.getStoredRefId() {
                    print("Stored refId = \(storedRef)")
                } else {
                    print("No RefID Stored in coredata")
                }
                
                if let storedCust = SqlCoreData.shared.getStoredCustCode() {
                    print("Stored custCode = \(storedCust)")
                } else {
                    print("No CustCode Stored in coreData")
                }
                
                if let storedUserName = SqlCoreData.shared.getStoredUserName() {
                    print("Stored UserName = \(storedUserName)")
                } else {
                    print("No CustCode Stored in coreData")
                }
                
                if let storedCustName = SqlCoreData.shared.getStoredCustName() {
                    print("Stored CustName = \(storedCustName)")
                } else {
                    print("No CustCode Stored in coreData")
                }
                
                SqlCoreData.shared.whereIsMySQLite()
                
            case.failure(let error):
                // Try to extract the data from the response if available
                if let data = response.data{
                    print("Raw Data from response: \(String(data: data, encoding: .utf8) ?? "")")
                }
                completion(.failure(error))
            }
        }
    }
    
    
    //Function to login when OTP is Required
    func loginotp(username: String, password: String, otp: String, completion: @escaping(Result<LoginResponseModel, AFError>) -> Void) {
        let imei = UIDevice.current.identifierForVendor?.uuidString ?? ""
        AF.request(Login_With_Otp_URL, method: .post, parameters: [
            "userName": username,
            "password": password,
            "appVersion": Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "",
            "imei": UIDevice.current.identifierForVendor?.uuidString ?? "",
            "otp": otp,
            "operation": "D"
        ], encoder: JSONParameterEncoder.default, headers: headers).responseDecodable(of: LoginResponseModel.self) { response in
            print(Login_With_Otp_URL, username, password, otp, imei, self.headers)
            switch response.result {
            case.success(let loginResponse):
                // Handle successful response with your LoginResponseModel
                completion(.success(loginResponse))
                print(loginResponse.data.refId)
                print(loginResponse.token)
                
                SqlCoreData.shared.saveRefId(String(loginResponse.data.refId))
                SqlCoreData.shared.saveCustCode(loginResponse.data.custCode)
                SqlCoreData.shared.saveUserName(loginResponse.data.username)
                SqlCoreData.shared.saveCustomerName(loginResponse.data.refname)
                
                Auth.shared.setCredentials(accessToken: loginResponse.token)
                
                if let storedRef = SqlCoreData.shared.getStoredRefId() {
                    print("Stored refId = \(storedRef)")
                } else {
                    print("No RefID Stored in coredata")
                }
                
                if let storedCust = SqlCoreData.shared.getStoredCustCode() {
                    print("Stored custCode = \(storedCust)")
                } else {
                    print("No CustCode Stored in coreData")
                }
                
                if let storedUserName = SqlCoreData.shared.getStoredUserName() {
                    print("Stored UserName = \(storedUserName)")
                } else {
                    print("No CustCode Stored in coreData")
                }
                
                if let storedCustName = SqlCoreData.shared.getStoredCustName() {
                    print("Stored CustName = \(storedCustName)")
                } else {
                    print("No CustCode Stored in coreData")
                }
                
                SqlCoreData.shared.whereIsMySQLite()
                
            case.failure(let error):
                // Try to extract the data from the response if available
                if let data = response.data{
                    print("Raw Data from response: \(String(data: data, encoding: .utf8) ?? "")")
                }
                completion(.failure(error))
            }
        }
    }
    
    
    // Function to get the Consignors of the Customer using the RefId
    func getConsignors( completion: @escaping (Result<ConsignorListRespone, AFError>) -> Void) {
        guard let token = Auth.shared.getAccessToken() else {
            return
        }
        // Define custom headers
        let customHeaders: HTTPHeaders = [
            "Authorization": "Bearer " + token
        ]
        
        let storedRef = SqlCoreData.shared.getStoredRefId()
        print("Ref id is:  \(String(describing: storedRef))")
        // Define your query parameters
        let parameters: Parameters = [
            "customerId": storedRef ?? "null"
        ]
        AF.request(GET_CONSIGNORS_URL, method: .get, parameters: parameters, headers: customHeaders).responseDecodable(of: ConsignorListRespone.self) { response in
            print(GET_CONSIGNORS_URL, customHeaders, parameters)
            switch response.result {
            case.success(let consignorResponse):
                completion(.success(consignorResponse))
                print("Consignor Data Count: \(consignorResponse.data.count)")
                print(consignorResponse.message)
                for consignor in consignorResponse.data {
                        print(consignor)
                }
                for consignor in consignorResponse.data {
                    if let consignorName = consignor.consignorName {
                        print(consignorName)
                    }
                }
            case.failure(let error):
                if let data = response.data{
                    print("Raw Data from response: \(String(data: data, encoding: .utf8) ?? "")")
                }
                completion(.failure(error))
            }
            
        }
    }
    
    
    // Function to get the Consignees of the Customer using the RefId
    func getConsignees( completion: @escaping (Result<ConsigneeListResponse, AFError>) -> Void) {
        guard let token = Auth.shared.getAccessToken() else {
            return
        }
        // Define custom headers
        let customHeaders: HTTPHeaders = [
            "Authorization": "Bearer " + token
        ]
        
        let storedRef = SqlCoreData.shared.getStoredRefId()
        print("Ref id is:  \(String(describing: storedRef))")
        // Define your query parameters
        let parameters: Parameters = [
            "customerId": storedRef ?? "null"
        ]
        AF.request(GET_CONSIGNEES_URL, method: .get, parameters: parameters, headers: customHeaders).responseDecodable(of: ConsigneeListResponse.self) { response in
            print(GET_CONSIGNEES_URL, customHeaders, parameters)
            switch response.result {
            case.success(let consigneeResponse):
                completion(.success(consigneeResponse))
                print("Consignee Data Count: \(consigneeResponse.data.count)")
                print(consigneeResponse.message)
                for consignee in consigneeResponse.data {
                        print(consignee)
                }
                for consignee in consigneeResponse.data {
                    if let consigneeName = consignee.consigneeName {
                        print(consigneeName)
                    }
                }
            case.failure(let error):
                if let data = response.data{
                    print("Raw Data from response: \(String(data: data, encoding: .utf8) ?? "")")
                }
                completion(.failure(error))
            }
            
        }
    }
    
    
    //TODO// Function to get the Distance & TAT Calculation
    
    
    //TODO// Function for the Rate Calculator
    
    
    //TODO// Function to get the pickupOrders
    
    
    //TODO// Function to get the Dockets
    
    
    //TODO// Function to create a Pickup Order
    
    
    //TODO// Function to Track Dockets
    
    
}
