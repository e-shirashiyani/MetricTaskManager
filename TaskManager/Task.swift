//
//  Task.swift
//  TaskManager
//
//  Created by e.shirashiyani on 5/12/23.
//
///Create a Task model to represent a task with a title, description, and completion status.
///
import Foundation
struct Task: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var description: String
    var isCompleted: Bool
}
