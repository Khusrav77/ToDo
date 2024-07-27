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
    @Environment (\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            
            // MARK: Background
            LinearGradient(
                colors: [Color.toDoBackground1, Color.toDoBackground2],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            // MARK: TextField
            VStack (spacing: 25){
                TextField("Enter Your New Task", text: $vm.newTask)
                    .font(.headline)
                    .padding()
                    .background(Color.toDoPrimary.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                // MARK: Add Task Button
                Button {
                    vm.addTask(task: vm.newTask)
                    dismiss()
                } label: {
                    Text("Add Task")
                        .font(.headline)
                        .padding()
                        .foregroundStyle(Color.toDoBackground1)
                        .frame(maxWidth: .infinity)
                        .background(Color.toDoAccent)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
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
                    dismiss()
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
