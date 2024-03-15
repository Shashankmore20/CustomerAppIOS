//
//  LoginScreen.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 20/02/24.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    
    var body: some View { 
        
        NavigationView{
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("OxyzenLogoFull")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 100)
                        .padding()
                    
                    Text("Oxyzen Customer")
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .foregroundColor(.black)
                        .padding()
                    
                    VStack {
                        TextField(" ", text: $viewModel.username, prompt: Text("Username").foregroundColor(Color.gray))
                            .padding(EdgeInsets(top: 15, leading: 40, bottom: 15, trailing: 10))
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                            .font(.custom("Poppins-Medium", size: 16))
                            .foregroundColor(.red)
                            .autocapitalization(.none)
                            .overlay(
                                HStack {
                                    Image(systemName: "person.fill")
                                        .padding(.leading, 10)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            )
                        
                        HStack {
                            if viewModel.isPasswordVisible {
                                TextField(" ", text: $viewModel.password, prompt: Text("Password").foregroundColor(Color.gray))
                                    .padding(EdgeInsets(top: 15, leading: 40, bottom: 15, trailing: 10))
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                                    .font(.custom("Poppins-Medium", size: 16))
                                    .foregroundColor(.red)
                                    .autocapitalization(.none)
                                    .overlay(
                                        HStack {
                                            Image(systemName: "lock.fill")
                                                .padding(.leading, 10)
                                                .foregroundColor(.black)
                                            Spacer()
                                            Button(action: {
                                                viewModel.isPasswordVisible.toggle()
                                            }) {
                                                Image(systemName: "eye.slash")
                                                    .padding(.trailing, 10)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    )
                            } else {
                                SecureField(" ", text: $viewModel.password, prompt: Text("Password").foregroundColor(Color.gray))
                                    .padding(EdgeInsets(top: 15, leading: 40, bottom: 15, trailing: 10))
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                                    .font(.custom("Poppins-Medium", size: 16))
                                    .foregroundColor(.red)
                                    .autocapitalization(.none)
                                    .overlay(
                                        HStack {
                                            Image(systemName: "lock.fill")
                                                .padding(.leading, 10)
                                                .foregroundColor(.black)
                                            Spacer()
                                            Button(action: {
                                                viewModel.isPasswordVisible.toggle()
                                            }) {
                                                Image(systemName: "eye")
                                                    .padding(.trailing, 10)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    )
                            }
                        }
                        .padding(.bottom, 15)
                        
                        HStack {
                            CheckBox(isChecked: $viewModel.rememberUsername)
                                .foregroundColor(.black)
                                .padding(.leading, 5)
                            
                            Text("Remember Username")
                                .font(.custom("Poppins-Medium", size: 13.4))
                                .foregroundColor(.black)
                                .padding(.leading, 1)
                            
                            Spacer()
                            
                            NavigationLink(destination: ForgotPasswordView()) {
                                Text("Forgot Password?")
                                    .font(.custom("Poppins-Medium", size: 12))
                                    .foregroundColor(Color(hex: 0x919090))
                                    .padding(.trailing, 18)
                            }
                        }
                        .padding(.bottom, 20)
                        
                        // The fumction for the LOGIN BUTTON
                        Button(action: {
                            let loginModel = LoginModel(userName: self.viewModel.username, password: self.viewModel.password)
                            //Call the Function from the VM
                            self.viewModel.handleLogin(loginModel: loginModel)
                        }) {
                            // The design of the login button being called from the Buttons folder
                            LoginScreenButtons(title: "Login")
                        }
                        .background(
                            NavigationLink(destination: DashboardTabView(), isActive: $viewModel.navigateToDashboard) {
                                EmptyView()
                            }
                                .hidden()
                        )
                        //
                        
                        // In Case we need the signup button just remove the .hidden function
                        Button(action: {
                            // Sign Up button action
                        }) {
                            LoginScreenButtons(title: "Sign Up")
                        }.hidden()
                        //
                    }
                    .padding(5)
                    
                    Spacer()
                }
                .padding()
            }
        }
        .alert("Log in", isPresented: $viewModel.showAlert) {
            TextField("OTP", text: $viewModel.otpTextField)
                .textContentType(.oneTimeCode)
                .keyboardType(.numberPad)
                .onChange(of: viewModel.otpTextField) { newValue in
                    if newValue.count > 6 {
                        viewModel.otpTextField = String(newValue.prefix(6))
                    }
                }
            Button("OK", action: handleLoginWithOTP)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please enter your username and password.")
        }
        .alert("Login Error", isPresented: $viewModel.showLoginErrorAlert) {
            Button("OK") {
                // Handle OK button action if needed
                viewModel.showLoginErrorAlert = false
            }
            .foregroundStyle(.blue)
        } message: {
            Text(viewModel.errorMessage)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
    
    // //Function to Handle Login with OTP, need to move it to the VM later
    private func handleLoginWithOTP() {
        // Add your logic to handle the login with OTP
        print("Login with OTP: \(viewModel.otpTextField)")
        //Call API
        ApiManager.shareInstance.loginotp(username: viewModel.username, password: viewModel.password, otp: viewModel.otpTextField) { result in
            switch result {
            case.success(let loginResponse):
                print("Login successful: \(loginResponse)")
                
                if loginResponse.data.otpReq {
                    // OTP is required, show OTP view
                    viewModel.showAlert = true
                } else {
                    viewModel.navigateToDashboard = true
                }
            case .failure(let error):
                // Handle the failure, can display an error message or handle it based on the requirements
                print("Login failed with error: \(error)")
                viewModel.errorMessage = "Login failed. Please try again."
                viewModel.showLoginErrorAlert = true
            }
        }
    }
    // //
    
    //This is the code to discover the fontnames and to check for the fonts in the xcode project
    init(){
        for familyName in UIFont.familyNames{
            print(familyName)
            for fontName in UIFont.fontNames(forFamilyName: familyName){
                print("-- \(fontName)")
            }
        }
    }
    // End of Function. Copy and paste in the any project to check for the fonts.
}


// The code to add a function to the CheckBox when it is checked
struct CheckBox: View {
    @Binding var isChecked: Bool
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 15, height: 15)
        }
    }
}


// This is the ForgorPasswordView Link Code Can move it later(Need to move it Later ) //TODO
struct ForgotPasswordView: View {
    var body: some View {
        Text("Forgot Password View")
    }
}


// This is an extension of the In-Built Function color to use the custom Hex colors.
extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}


// The code to check the preivew Screen on the right for the View without this, preview will not show up.
struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
