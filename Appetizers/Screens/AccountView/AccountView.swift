//
//  AccountView.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 19/10/2025.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField : FormTextField?
    
    enum FormTextField{
        case firstName, lastName, email
    }
    
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
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("Last name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)


                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)


                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
//                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo, displayedComponents: .date)
                    
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
