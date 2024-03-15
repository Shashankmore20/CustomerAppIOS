//
//  Auth.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 20/02/24.
//

import Foundation
import SwiftKeychainWrapper

class Auth: ObservableObject {
    
    struct Credentials {
        var accessToken: String?
    }
    
    enum KeychainKey: String {
        case accessToken
    }
    
    static let shared: Auth = Auth()
    private let keychain: KeychainWrapper = KeychainWrapper.standard
    
    @Published var loggedIn: Bool = false
    
    private init() {
        loggedIn = hasAccessToken()
    }
    
    func getCredentials() -> Credentials {
        return Credentials(
            accessToken: keychain.string(forKey: KeychainKey.accessToken.rawValue)
        )
    }
    
    func setCredentials(accessToken: String) {
        keychain.set(accessToken, forKey: KeychainKey.accessToken.rawValue)
        
        loggedIn = true
    }
    
    func hasAccessToken() -> Bool {
        return getCredentials().accessToken != nil
    }
    
    func getAccessToken() -> String? {
//        print(getCredentials().accessToken!)
        return getCredentials().accessToken
    }
    
    func logout() {
        KeychainWrapper.standard.removeObject(forKey: KeychainKey.accessToken.rawValue)
        SqlCoreData.shared.deleteAllUserData()
        loggedIn = false
    }
}
