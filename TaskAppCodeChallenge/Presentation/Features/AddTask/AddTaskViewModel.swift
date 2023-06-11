//
//  AddTaskViewModel.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation

final class AddTaskViewModel: ObservableObject {

    @Published var title: String = ""
    @Published var description: String = ""
    
    private let createTaskUserCase: CreateTaskUseCaseProtocol

    init(createTaskUserCase: CreateTaskUseCaseProtocol) {
        self.createTaskUserCase = createTaskUserCase
    }

    func addTask() {
        do {
            let task = TaskModel(title: title, descriptions: description)
            try createTaskUserCase.createTasks(with: task)
        } catch {}
    }
}
