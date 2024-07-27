//
//  ToDoViewModel.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/27/24.
//

import Foundation

class ToDoViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var tasks: [TaskModel] = []
    @Published var newTask = ""
    
    // MARK: - Methods
    func addTask(task: String) {
        let newTask = TaskModel(title: task)
        tasks.append(newTask)
    }
    
}
