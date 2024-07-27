//
//  BackgroundViewGradient.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/27/24.
//

import SwiftUI

struct BackgroundViewGradient: View {
    var body: some View {
        
        LinearGradient(
            colors: [Color.toDoBackground1, Color.toDoBackground2],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .ignoresSafeArea()
    
    }
}

#Preview {
    BackgroundViewGradient()
}
