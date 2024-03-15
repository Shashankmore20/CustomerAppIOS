//
//  LoginViewModel.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 20/02/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    @Published var rememberUsername = false
    @Published var isPasswordVisible = false
    @Published var navigateToDashboard = false
    @Published var showAlert = false
    @Published var showLoginErrorAlert = false  // Add this line
    @Published var errorMessage = ""
    @Published var otpTextField = ""
    
    let textLimit = 6
    
    // Function to Handle the login when OTP is not Needed
    func handleLogin(loginModel: LoginModel) {
        // Call API
        ApiManager.shareInstance.LoginApi(login: loginModel) { result in
            switch result {
            case.success(let loginResponse):
                print("Login successful: \(loginResponse)")
                
                if loginResponse.data.otpReq {
                    // OTP is required, show OTP view
                    self.showAlert = true
                } else {
                    self.navigateToDashboard = true
                }
            case .failure(let error):
                // Handle the failure, you can display an error message or handle it based on your requirements
                print("Login failed with error: \(error)")
                self.errorMessage = "Login failed. Please check your credentials and try again."
                self.showLoginErrorAlert = true
            }
        }
    }
    
    
    // Function to Handle the login when OTP is Needed
    func handleLoginWithOTP() {
        // Add your logic to handle the login with OTP
        print("Login with OTP: \(self.otpTextField)")
        //Call API
        ApiManager.shareInstance.loginotp(username: self.username, password: self.password, otp: self.otpTextField) { result in
            switch result {
            case.success(let loginResponse):
                print("Login successful: \(loginResponse)")
                
                if loginResponse.data.otpReq {
                    // OTP is required, œshow OTP view
                    self.showAlert = true
                } else {
                    self.navigateToDashboard = true
                }
            case .failure(let error):
                // Handle the failure, you can display an error message or handle it based on your requirements
                print("Login failed with error: \(error)")
                self.errorMessage = "Login failed. Please try again."
                self.showLoginErrorAlert = true
            }
        }
    }
    
}
