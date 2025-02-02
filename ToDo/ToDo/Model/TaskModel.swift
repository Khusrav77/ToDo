//
//  TaskModel.swift
//  ToDo
//
//  Created by Khusrav Safiev on 7/25/24.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
