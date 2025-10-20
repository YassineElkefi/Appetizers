//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 19/10/2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationView{
            List(appetizers){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
        .onAppear{
            getAppetizers()
        }
    }
    
    func getAppetizers(){
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let appetizers ):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
