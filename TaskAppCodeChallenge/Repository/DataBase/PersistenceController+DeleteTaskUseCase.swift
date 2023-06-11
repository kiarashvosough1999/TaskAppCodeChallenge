//
//  PersistenceController+DeleteTaskUseCase.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation

extension PersistenceController: DeleteTaskUseCaseProtocol {

    func deleteTask(_ task: TaskModel) throws {
        try context.performAndWait {
            guard let item = try findItem(with: task.id) else { throw PersistenceError.cannotFindEntity }

            context.delete(item)
            try saveContext()
        }
    }
}
