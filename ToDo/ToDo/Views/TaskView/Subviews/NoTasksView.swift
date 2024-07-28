//
//  SwiftUIView.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/28/24.
//

import SwiftUI

struct NoTasksView: View {
    
    // MARK: - Body
    var body: some View {
        
        VStack{
          
            Spacer()
            
            // MARK: - Text
            Text("THERE ARE NO TASKS\nWOULD YUO LIKE\n ADD?")
                .font(.title)
                .foregroundStyle(Color.toDoPrimary)
                .opacity(0.5)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            // MARK: - Button
            NavigationLink(destination: AddTaskView()) {
                ZStack{
                    Circle()
                        .frame(width: 100)
                        .foregroundStyle(Color.toDoPrimary)
                        .opacity(0.5)
                    
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundStyle(Color.toDoBackground2)
                        
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    NoTasksView()
        .preferredColorScheme(.dark)
    
}
