//
//  ContentView.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @ObservedObject var viewModel: TaskListViewModel

    init(viewModel: TaskListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $viewModel.filterCompleted) {
                    Text("Show completed tasks")
                }
                .animation(.easeInOut, value: viewModel.filterCompleted)
                .padding()

                List {
                    ForEach(viewModel.filteredTasks) { item in
                        NavigationLink {
                            TaskOverView(
                                viewModel: TaskOverViewModel(task: item)
                            )
                        } label: {
                            HStack {
                                CheckBoxView(checked: item.completed) {
                                    viewModel.toggleTaskCompletion(task: item)
                                }
                                Text(item.title).padding(.leading, 8)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deleteTasks(at:))
                    .onMove(perform: viewModel.moveTasks)
                }
                .sheet(isPresented: $viewModel.isPresented) {
                    AddItemView(
                        viewModel: AddTaskViewModel(createTaskUserCase: viewModel.createTaskUseCase)
                    )
                        .presentationDetents([.medium])
                    EmptyView()
                }
                .toolbar {
                    ToolbarItem {
                        Button(action: viewModel.presentAddingTask) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                Text("Select an item")
            }
        }
        .onAppear {
            viewModel.load()
        }
    }
}
