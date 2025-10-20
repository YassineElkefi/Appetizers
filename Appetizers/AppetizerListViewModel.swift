//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 20/10/2025.
//

import SwiftUI
import Combine

final class AppetizerListViewModel: ObservableObject{
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?

    func getAppetizers(){
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                switch result{
                case .success(let appetizers ):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error{
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
}
