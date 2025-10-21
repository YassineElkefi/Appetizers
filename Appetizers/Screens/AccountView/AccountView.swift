//
//  AccountView.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 19/10/2025.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    private var isShowingAlert: Binding<Bool> {
        Binding(
            get: { viewModel.alertItem != nil },
            set: { _ in viewModel.alertItem = nil }
        )
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .tint(.brandPrimary)
            }
            .navigationTitle("⚙️ Account")
        }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(viewModel.alertItem?.title ?? Text("Alert"),
               isPresented: isShowingAlert){
            Button(viewModel.alertItem?.dismissButtonTitle ?? "OK"){
                viewModel.alertItem = nil
            }
        }message: {
            viewModel.alertItem?.message ?? Text("")
        }
    }
}

#Preview {
    AccountView()
}
