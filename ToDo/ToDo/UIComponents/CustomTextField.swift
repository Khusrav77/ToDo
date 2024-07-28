//
//  CustomTextField.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/27/24.
//

import SwiftUI

struct CustomTextField: View {
    // MARK: - Properties
    @EnvironmentObject var vm: ToDoViewModel
    let placeholder: String
    
    // MARK: - Body
    var body: some View {
        
        TextField(placeholder, text: $vm.newTask)
            .font(.headline)
            .padding()
            .background(Color.toDoPrimary.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    CustomTextField(placeholder: "Enter Your New Task")
        .environmentObject(ToDoViewModel())
        .preferredColorScheme(.dark)
}
