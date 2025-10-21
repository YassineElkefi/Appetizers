//
//  OrderView.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 19/10/2025.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(orderItems){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    
                    Button{
                        print("Order Placed")
                    }label: {
                        APButton(title: "20.99 TND - Place Order")
                    }
                    .padding(.bottom, 25)
                }
                if orderItems.isEmpty{
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\n Please add an appetizer")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
