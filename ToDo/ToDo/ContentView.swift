//
//  ContentView.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TaskListView()
    }
}

#Preview {
    ContentView()
        .environmentObject(ToDoViewModel())
        .preferredColorScheme(.dark)
}
