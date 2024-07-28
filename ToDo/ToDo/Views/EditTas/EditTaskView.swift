//
//  EditTaskView.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/27/24.
//

import SwiftUI

struct EditTaskView: View {
    
// MARK: - Properties
    var task: TaskModel
    @EnvironmentObject var vm: ToDoViewModel
    @Environment(\.dismiss) private var dismiss
    
    // MARK: Body
    var body: some View {
        
        VStack{
            
            // MARK: Nav Bar
            HStack{
                // Title
                Text("Edit Task")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                // Cancle Button
                    .overlay(alignment: .topLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .frame(width: 56)
                                .foregroundStyle(Color.toDoAccent)
                        }
                    }
                    .padding(.vertical)
            }
            
            // MARK: TextField
            CustomTextField(placeholder: "Edit Your Task")
            
            // MARK: Button Save
            CustomButton(titel: "Save") {
                vm.updateTask(id: task.id, title: vm.newTask)
            }
            Spacer()
        }
        .padding(.horizontal)
        .background(BackgroundViewGradient())
        .onAppear {
            vm.newTask = task.title
        }
            
    }
}

#Preview {
    EditTaskView(task: TaskModel(title: "Task 1"))
        .environmentObject(ToDoViewModel())
        .preferredColorScheme(.dark)
}
