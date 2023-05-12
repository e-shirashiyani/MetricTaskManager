//
//  TaskRow.swift
//  TaskManager
//
//  Created by e.shirashiyani on 5/12/23.
/// Create the user interface using SwiftUI for each item of task

import SwiftUI

struct TaskRow: View {
    let task: Task
    let onComplete: (Task) -> Void

    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            if task.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .onTapGesture {
                        onComplete(task)
                    }
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        onComplete(task)
                    }
            }
        }
    }
}
