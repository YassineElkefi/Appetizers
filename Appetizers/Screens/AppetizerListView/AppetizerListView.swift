//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 19/10/2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    private var isShowingAlert: Binding<Bool> {
        Binding(
            get: { viewModel.alertItem != nil },
            set: { _ in viewModel.alertItem = nil }
        )
    }
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            if viewModel.isLoading{
                LoadingView()
            }
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
    AppetizerListView()
}
