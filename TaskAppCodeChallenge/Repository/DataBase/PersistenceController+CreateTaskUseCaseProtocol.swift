//
//  PersistenceController+CreateTaskUseCaseProtocol.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

extension PersistenceController: CreateTaskUseCaseProtocol {

    func createTasks(with model: TaskModel) throws {
        try context.performAndWait {
            let task = Item(context: context)
            task.title = model.title
            task.descriptions = model.descriptions
            task.timestamp = model.timestamp
            task.completed = model.completed

            let count = (try? context.count(for: Item.fetchRequest())) ?? 0
            task.offset = Int16(count)
            try saveContext()
        }
    }
}
