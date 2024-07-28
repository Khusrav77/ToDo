//
//  TaskCell.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/27/24.
//

import SwiftUI

struct TaskCell: View {
    
    // MARK: - Properties
    var model: TaskModel
    let action: () -> ()
    
    // MARK: - Body
    var body: some View {
        HStack {
            
            if model.isCompleted {
                Text(model.title)
                    .strikethrough()
                    .foregroundStyle(Color.toDoPrimary.opacity(0.5))
                
            } else {
                Text(model.title)
            }
            
            Spacer()
            
            // MARK: Task Completetion Toggle
            Button{
                action()
            }label: {
                Image(systemName: model.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(Color.toDoAccent)
            }
            .buttonStyle(.borderless)
        }
        .font(.headline)
        .padding()
        .background(
            model.isCompleted ? Color.toDoPrimary.opacity(0.1) :
                Color.toDoPrimary.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .padding(.vertical, 6)
        
    }
}
                     

#Preview {
    List{
        TaskCell(model: TaskModel(title: "Task 1", isCompleted: true), action: {})
        TaskCell(model: TaskModel(title: "Task 2", isCompleted: false), action: {})
    }
    .listStyle(.plain)
    .preferredColorScheme(.dark)
}
