//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 19/10/2025.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView{
            List(MockData.appetizers){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
