//
//  CustomButton.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/27/24.
//

import SwiftUI

struct CustomButton: View {
    
    // MARK: - Properties
    @EnvironmentObject var vm: ToDoViewModel
    @Environment (\.dismiss) private var dismiss
    let titel: String
    let action: () -> ()
    
    // MARK: - Body
    var body: some View {
        
        Button {
            action()
            dismiss()
        } label: {
            Text(titel)
                .font(.headline)
                .padding()
                .foregroundStyle(Color.toDoBackground1)
                .frame(maxWidth: .infinity)
                .background(Color.toDoAccent)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    CustomButton(titel: "Add Task"){}
        .environmentObject(ToDoViewModel())
        .preferredColorScheme(.dark)
}
