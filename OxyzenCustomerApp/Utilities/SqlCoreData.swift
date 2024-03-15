//
//  SqlCoreData.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 07/03/24.
//

import Foundation
import CoreData

class SqlCoreData {
    
    static let shared = SqlCoreData()
    static let shareInstance = SqlCoreData()
    private init() {}
    
    
    // // the functions below are being used to store the Data which is needed by other activites in the Sqlite table of the application using CoreData
    //Function to Save Reference Id/ the User Id
    func saveRefId(_ refId: String) {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<UserDetails> = UserDetails.fetchRequest()
        
        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                // Update existing entry
                user.refId = refId
            } else {
                // Create a new entry
                let newUser = UserDetails(context: context)
                newUser.refId = refId
            }
            
            try context.save()
        } catch {
            print("Error saving refId to CoreData: \(error)")
        }
    }
    //
    // Function to Save Customer Code
    func saveCustCode(_ custCode: String) {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<UserDetails> = UserDetails.fetchRequest()
        
        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                // Update existing entry
                user.custCode = custCode
            } else {
                // Create a new entry
                let newUser = UserDetails(context: context)
                newUser.custCode = custCode
            }
            
            try context.save()
        } catch {
            print("Error saving custCode to CoreData: \(error)")
        }
    }
    //
    // Function to Save the Customer Name
    func saveCustomerName(_ customerName: String) {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<UserDetails> = UserDetails.fetchRequest()
        
        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                // Update existing entry
                user.customerName = customerName
            } else {
                // Create a new entry
                let newUser = UserDetails(context: context)
                newUser.customerName = customerName
            }
            
            try context.save()
        } catch {
            print("Error saving custCode to CoreData: \(error)")
        }
    }
    //
    // Function to Save the User Name
    func saveUserName(_ userName: String) {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<UserDetails> = UserDetails.fetchRequest()
        
        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                // Update existing entry
                user.userName = userName
            } else {
                // Create a new entry
                let newUser = UserDetails(context: context)
                newUser.userName = userName
            }
            
            try context.save()
        } catch {
            print("Error saving custCode to CoreData: \(error)")
        }
    }
    //
    // //
    
    
    // // the functions below are being used to get the stored the Data which is needed by other activites in the Sqlite table of the application using CoreData
    // Function to get the Ref ID
    func getStoredRefId() -> String? {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<UserDetails>(entityName: "UserDetails")
        
        do {
            let users = try context.fetch(request)
            return users.first?.refId
        } catch {
            print("Error fetching refId from CoreData: \(error)")
            return nil
        }
    }
    //
    // Function to get the Customer Code
    func getStoredCustCode() -> String? {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<UserDetails>(entityName: "UserDetails")
        
        do {
            let users = try context.fetch(request)
            return users.first?.custCode
        } catch {
            print("Error fetching custCode from CoreData: \(error)")
            return nil
        }
    }
    //
    // Function to get the Customer Name
    func getStoredCustName() -> String? {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<UserDetails>(entityName: "UserDetails")
        
        do {
            let users = try context.fetch(request)
            return users.first?.customerName
        } catch {
            print("Error fetching CustomerName from CoreData: \(error)")
            return nil
        }
    }
    //
    // Function to get the User Name
    func getStoredUserName() -> String? {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<UserDetails>(entityName: "UserDetails")
        
        do {
            let users = try context.fetch(request)
            return users.first?.userName
        } catch {
            print("Error fetching userName from CoreData: \(error)")
            return nil
        }
    }
    //
    // //
    
    
    // Function that deletes all the Data of the UserDetails Database on Logout
    func deleteAllUserData() {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<UserDetails>(entityName: "UserDetails")
        
        do {
            let users = try context.fetch(request)
            for user in users {
                context.delete(user)
            }
            
            try context.save()
        } catch {
            print("Error deleting all data from CoreData: \(error)")
        }
    }
    //
    
    // Function to check the location of the Sqlite Database
    func whereIsMySQLite() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding
        
        print(path ?? "Not found")
    }
    //
    
    
    // // This function defines the NSPersistentContainer, class proided by CoreData to encapsulate the Core Data Functions
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "OxyzenCustomerApp")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()
    // //
    
}
