//
//  LoadingView.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 20/10/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        //Large Spinner with different coloring
        ZStack {
            Color.white
                .ignoresSafeArea()
            ProgressView()
                .tint(.brandPrimary)
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
