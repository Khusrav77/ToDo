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
                    
                    if vm.tasks.isEmpty{
                        
                        // MARK: Empty List
                        NoTasksView()
                        
                    } else {
                        
                        // MARK: List of Tasks
                        List{
                            ForEach(vm.tasks) { task in
                                TaskCell(model: task) {
                                    vm.isCompetedTask(task: task)
                                }
                                .onTapGesture {
                                    vm.isselectedTask = task
                                    isEditViewPresented = true
                                }
                            }
                            .onDelete(perform: vm.deleteTask)
                            
                            // MARK: Edit View Sheet
                            .sheet(isPresented: $isEditViewPresented, content: {
                                
                                if let taskToEdit = vm.isselectedTask {
                                    EditTaskView(task:taskToEdit)
                                }
                            })
                        }
                        .listStyle(.plain)
                        
                        // MARK: Progress View
                        ProgressView("Completion Task", value: vm.completionProgress)
                            .font(.headline)
                            .accentColor(.toDoPrimary)
                            .padding()
                            .padding(.horizontal)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                   
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
