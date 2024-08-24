//
//  TaskModel.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/25/24.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let id: Int
    let title: String
    var isCompleted: Bool = false
    let userId: Int
}

struct TodoResponse: Codable {
    let todos: [TaskModel]
    let total: Int
    let skip: Int
    let limit: Int
}
