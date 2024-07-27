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
    @State private var isEditViewPresented = false
    
// MARK: - Body
    var body: some View {
        
        NavigationView {
            ZStack {
                
// MARK: - Background
                BackgroundViewGradient()
              
                VStack {
                    List{
                        ForEach(vm.tasks) { task in
                            TaskCell(model: task) {
                                vm.isCompetedTask(task: task)
                            }
                            .onTapGesture {
                                isEditViewPresented = true
                            }
                        }
                        .onDelete(perform: vm.deleteTask)
                        
                        // MARK: Edit View Sheet
                        .sheet(isPresented: $isEditViewPresented, content: {
                            EmptyView()
                        })
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
