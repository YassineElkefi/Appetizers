//
//  ContentView.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 19/10/2025.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            Tab("Appetizers", systemImage: "house"){
                AppetizerListView()
            }
            Tab("Account", systemImage: "person"){
                AccountView()
            }
            Tab("Order", systemImage: "bag"){
                AppetizerListView()
            }
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
