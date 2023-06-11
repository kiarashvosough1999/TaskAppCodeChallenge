//
//  PersistenceController+FetchTaskUseCaseProtocol.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation

extension PersistenceController: FetchTaskUseCaseProtocol {

    func fetchTasks() throws -> [TaskModel] {
        try context.performAndWait {
            let request = Item.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.offset, ascending: true)]
            let items: [Item] = try context.fetch(request)

            invalidateObjectIdsMap(items.map(\.objectID))

            return items.compactMap(map)
        }
    }
}
