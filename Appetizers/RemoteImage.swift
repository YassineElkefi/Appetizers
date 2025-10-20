//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 20/10/2025.
//

import SwiftUI

struct AppetizerRemoteImage: View {
        
    let urlString: String
    
    var body: some View {
        
        AsyncImage(url: URL(string: urlString)){ phase in
            switch phase {
            case .empty:
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure(_):
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            @unknown default:
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        
    }
}
