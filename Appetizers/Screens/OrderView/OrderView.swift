//
//  OrderView.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 19/10/2025.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    
                    Button{
                        print("Order Placed")
                    }label: {
                        //APButton(title: "\(order.totalPrice, specifier: "%.2f") TND - Place Order")
                        Text("\(order.totalPrice, specifier: "%.2f") TND - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }
                if order.items.isEmpty{
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\n Please add an appetizer")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
