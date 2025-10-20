//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 20/10/2025.
//

import SwiftUI
import Combine

final class AccountViewModel: ObservableObject{
   @Published var firstName = ""
   @Published var lastName = ""
   @Published var email = ""
   @Published var birthdate = Date()
   @Published var extraNapkins = false
   @Published var frequentRefills = false
    @Published var alertItem: AlertItem?
    
   var isValidForm: Bool{
       guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else{
           alertItem = AlertContext.invalidForm
           return false
       }
        
       guard email.isValidEmail else{
           alertItem = AlertContext.invalidEmail
           return false
       }
       
       return true
    }
    
    func saveChanges(){
        guard isValidForm else{
            return
        }
        print("Changes Saved")
    }
}
