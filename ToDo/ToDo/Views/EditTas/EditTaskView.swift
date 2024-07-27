//
//  EditTaskView.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/27/24.
//

import SwiftUI

struct EditTaskView: View {
    
// MARK: - Properties
    @EnvironmentObject var vm: ToDoViewModel
    
    // MARK: Body
    var body: some View {
        
        VStack{
            HStack{
                Text("Edit Task")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                    .overlay(alignment: .topLeading) {
                        Button {
                            
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
            
            // MARK: Button
            CustomButton(titel: "Save") {
                
            }
            Spacer()
        }
        .padding(.horizontal)
        .background(BackgroundViewGradient())
            
    }
}

#Preview {
    EditTaskView()
        .environmentObject(ToDoViewModel())
        .preferredColorScheme(.dark)
}
