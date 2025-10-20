//
//  AccountView.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 19/10/2025.
//

import SwiftUI

struct AccountView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthdate = Date()
    @State private var extraNapkins = false
    @State private var frequentRefills = false
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $firstName)
                    TextField("Last name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                    
                    Button{
                        print("save")
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")){
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Frequent Refills", isOn: $frequentRefills)
                }
                .tint(.brandPrimary)
            }
                .navigationTitle("⚙️ Account")
        }    }
}

#Preview {
    AccountView()
}
