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
            NavigationStack{
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(viewModel.isShowingDetail)
            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail{
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
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
