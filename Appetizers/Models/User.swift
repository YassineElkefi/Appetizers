//
//  User.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 21/10/2025.
//

import Foundation

struct User: Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
