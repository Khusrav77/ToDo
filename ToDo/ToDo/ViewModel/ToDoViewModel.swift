//
//  ToDoViewModel.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/27/24.
//

import Foundation

class ToDoViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var isselectedTask: TaskModel?
    @Published var newTask = ""
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTask()
        }
    }
    let keyUD = "keyUD"
    
    // Progress View Property
    var completionProgress: Double {
        let totalTask = tasks.count
        let comletionTasks = tasks.filter {$0.isCompleted}.count
        return totalTask > 0 ? Double(comletionTasks) / Double(totalTask) : 0
    }
    
    // MARK: - Initializer
    
    init() {
        getTasks()
    }
    
    // MARK: - Create
    func addTask(task: String) {
        let newTask = TaskModel(title: task)
        tasks.append(newTask)
    }
    
    // MARK: - Read
    func getTasks () {
        guard let data = UserDefaults.standard.data(forKey: keyUD) else { return }
        
        do {
            let decodeTask = try JSONDecoder().decode([TaskModel].self, from: data)
            DispatchQueue.main.async {
                self.tasks = decodeTask
            }
        } catch  {
            print("Error loading tasks \(error)")
        }
    }
   
    // MARK: - Delete
    func deleteTask(task: IndexSet) {
        tasks.remove(atOffsets: task)
    }
    
    // MARK: - Update
    func isCompetedTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    

    func saveTask() {
        do {
            let encodeTask = try JSONEncoder().encode(tasks)
            UserDefaults.standard.setValue(encodeTask, forKey: keyUD)
        } catch {
            print("Error saving task: \(error)")
        }
    }
    
    func updateTask(id: UUID, title: String) {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks[index].title = title
        }
    }
}

// Create
// Read
// Update
// Delete
