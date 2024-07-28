//
//  ToDoApp.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/25/24.
//

import SwiftUI

@main
struct ToDoApp: App {
    
    // MARK: - Properties
    
    @AppStorage("isDarkMode") private var isDarkMode = true
    @StateObject var vm = ToDoViewModel()
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            ContainerView()
                .environmentObject(vm)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
