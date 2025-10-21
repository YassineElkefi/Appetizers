//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 21/10/2025.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
    
}

