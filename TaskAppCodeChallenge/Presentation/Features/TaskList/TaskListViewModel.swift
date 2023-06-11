//
//  TaskListViewModel.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation
import Combine

final class TaskListViewModel: ObservableObject {

    let fetchTaskUseCase: FetchTaskUseCaseProtocol
    let createTaskUseCase: CreateTaskUseCaseProtocol
    let updateTaskUseCase: UpdateTaskUseCaseProtocol
    let observeTaskUseCase: ObserveTaskUseCaseProtocol
    let deleteTaskUseCase: DeleteTaskUseCaseProtocol
    
    @Published private var tasks: [TaskModel] = []

    var filteredTasks: [TaskModel] {
        tasks.filter {
            if filterCompleted == true && $0.completed == true {
                return true
            } else if filterCompleted == false {
                return true
            } else {
                return false
            }
        }
    }

    @Published var isPresented = false
    @Published var filterCompleted = false
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()

    // MARK: - LifeCycle
    
    init(
        fetchTaskUseCase: FetchTaskUseCaseProtocol,
        createTaskUseCase: CreateTaskUseCaseProtocol,
        updateTaskUseCase: UpdateTaskUseCaseProtocol,
        observeTaskUseCase: ObserveTaskUseCaseProtocol,
        deleteTaskUseCase: DeleteTaskUseCaseProtocol
    ) {
        self.fetchTaskUseCase = fetchTaskUseCase
        self.createTaskUseCase = createTaskUseCase
        self.updateTaskUseCase = updateTaskUseCase
        self.observeTaskUseCase = observeTaskUseCase
        self.deleteTaskUseCase = deleteTaskUseCase
    }

    // MARK: - APIs

    func load() {
        isPresented = false
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            do {
                self.tasks = try self.fetchTaskUseCase.fetchTasks()
            } catch {}
        }
        observeTaskUseCase
            .tasksDidChanged
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.load()
            }
            .store(in: &cancellables)
    }
    
    func presentAddingTask() {
        isPresented = true
    }

    func toggleTaskCompletion(task: TaskModel) {
        var mutableTask = task
        mutableTask.completed.toggle()
        do {
            try updateTaskUseCase.updateTasks(with: mutableTask)
        }  catch {}
    }

    func deleteTasks(at offsets: IndexSet) {
        let tasks = offsets.map { filteredTasks[$0] }
        do {
            try tasks.forEach { task in
                try deleteTaskUseCase.deleteTask(task)
            }
        } catch {}
    }

    func moveTasks(from source: IndexSet, to destination: Int) {
        var filteredTasks = filteredTasks
        filteredTasks.move(fromOffsets: source, toOffset: destination)
        filteredTasks.enumerated().forEach { (index, item) in
            filteredTasks[index].offset = Int16(index)
        }
        do {
            try filteredTasks.forEach { task in
                try updateTaskUseCase.updateTasks(with: task)
            }
        } catch {}
    }
}
