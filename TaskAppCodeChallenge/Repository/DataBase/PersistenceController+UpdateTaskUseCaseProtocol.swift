//
//  PersistenceController+UpdateTaskUseCaseProtocol.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation

extension PersistenceController: UpdateTaskUseCaseProtocol {

    func updateTasks(with model: TaskModel) throws {
        try context.performAndWait {
            guard let item = try findItem(with: model.id) else { throw PersistenceError.cannotFindEntity }

            item.title = model.title
            item.descriptions = model.descriptions
            item.timestamp = model.timestamp
            item.completed = model.completed
            item.offset = model.offset

            try saveContext()
        }
    }
}
