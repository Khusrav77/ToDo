//
//  ContainerView.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/28/24.
//

import SwiftUI

struct ContainerView: View {
   
    // MARK: - Properties
    @State private var isLaunchScreanViewPewsented = true
    
    // MARK: - Body
    var body: some View {
        if !isLaunchScreanViewPewsented {
            ContentView()
        } else {
            LaunchScreen(isPresented: $isLaunchScreanViewPewsented)
        }
    }
}

#Preview {
    ContainerView()
        .environmentObject(ToDoViewModel())
        .preferredColorScheme(.dark)
}
