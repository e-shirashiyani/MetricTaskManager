//
//  ContentView.swift
//  TaskManager
//
//  Created by e.shirashiyani on 5/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showCompletedTasks = false
    @State private var newTaskTitle = ""
    @State private var newTaskDescription = ""
    @ObservedObject var taskViewModel = TaskViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Toggle("Show Completed Tasks", isOn: $showCompletedTasks)
                    .padding(20)

                List {
                    ForEach(taskViewModel.filterTasks(isCompleted: showCompletedTasks)) { task in
                        TaskRow(task: task) { updatedTask in
                            taskViewModel.updateTask(task: updatedTask)
                        }
                    }
                    .onMove(perform: taskViewModel.moveTask)
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Tasks")
                .navigationBarItems(leading: EditButton(), trailing: addButton)

                HStack {
                    TextField("Task Title", text: $newTaskTitle)
                    TextField("Task Description", text: $newTaskDescription)
                }
                .padding()
            }
        }
    }

    var addButton: some View {
        Button(action: {
            if !newTaskTitle.isEmpty {
                taskViewModel.addTask(title: newTaskTitle, description: newTaskDescription)
                newTaskTitle = ""
                newTaskDescription = ""
            }
        }) {
            Image(systemName: "plus")
                .resizable()
                .padding(6)
                .frame(width: 24, height: 24)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding(.trailing)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
