//
//  TaskListView.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/25/24.
//

import SwiftUI

struct TaskListView: View {
    
// MARK: - Properties
    @EnvironmentObject var vm: ToDoViewModel
    
// MARK: - Body
    var body: some View {
        
        NavigationView {
            ZStack {
                
// MARK: - Background
                LinearGradient(
                    colors: [Color.toDoBackground1, Color.toDoBackground2],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                    .ignoresSafeArea()
              
                VStack {
                    List{
                        ForEach(vm.tasks) { task in
                            Text(task.title)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            
// MARK: - Navigation Bar
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddTaskView()) {
                        Image(systemName: "plus")
                            .foregroundStyle(Color.toDoPrimary)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    TaskListView()
        .environmentObject(ToDoViewModel())
        .preferredColorScheme(.dark)
}
