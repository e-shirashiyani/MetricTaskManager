//
//  TaskViewModel.swift
//  TaskManager
//
//  Created by e.shirashiyani on 5/12/23.
//
///Create a view model to manage tasks and handle adding, updating, and filtering tasks.

import SwiftUI
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func addTask(title: String, description: String) {
        let task = Task(title: title, description: description, isCompleted: false)
        tasks.append(task)
    }
    
    func updateTask(task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func filterTasks(isCompleted: Bool) -> [Task] {
        return tasks.filter { $0.isCompleted == isCompleted }
    }
    
    func moveTask(fromOffsets: IndexSet, toOffset: Int) {
        tasks.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}
