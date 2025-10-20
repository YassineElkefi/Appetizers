//
//  Alert.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 20/10/2025.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButtonTitle: String
}

struct AlertContext{
    //MARK: - Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                      message: Text("The data received from the server was invalid. Please contact support."),
                                      dismissButtonTitle: "OK")
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid Response from the server. Please try again later or contact support."),
                                           dismissButtonTitle:  "OK")
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                       dismissButtonTitle: "OK")
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButtonTitle: "OK")

    //MARK: - Account Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                            message: Text("Please ensure all fields in the form have been filled out."),
                                            dismissButtonTitle: "OK")
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please ensure that your email is correct."),
                                            dismissButtonTitle: "OK")
}

