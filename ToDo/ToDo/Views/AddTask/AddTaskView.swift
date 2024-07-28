//
//  AddTaskView.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/25/24.
//

import SwiftUI

struct AddTaskView: View {
    
    // MARK: - Properties
    @EnvironmentObject var vm: ToDoViewModel
    
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            
            // MARK: Background
           BackgroundViewGradient()
            
            VStack (spacing: 25){
                // MARK: TextField
                CustomTextField(placeholder: "Enter Your New Task")
                
                
                // MARK: Add Task Button
                CustomButton(titel: "Add Task") {
                    vm.addTask(task: vm.newTask)
                }
                .disabled(vm.newTask.isEmpty)
                
                Spacer()
            }
            .padding()
        }
        
        // MARK: - Navigation Bar
        .navigationTitle("Add Task")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    //dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundStyle(Color.toDoAccent)
                }
            }
        }
        .onAppear {
            vm.newTask = ""
        }
    }
}

#Preview {
    NavigationView {
        AddTaskView()
            .environmentObject(ToDoViewModel())
            .preferredColorScheme(.dark)
    }
}
