//
//  Persistence.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import CoreData

final class PersistenceController {
    
    enum PersistenceError: Error {
        case cannotFindEntity
    }
    
    var objectIdToId: [Int: NSManagedObjectID] = [:]
    
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer
    var context: NSManagedObjectContext {
        container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TaskAppCodeChallenge")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    func map(_ item: Item) -> TaskModel? {
        guard
            let id = findIdFromObjectIdsMap(for: item),
            let descriptions = item.descriptions,
            let timestamp = item.timestamp,
            let title = item.title
        else { return nil }
        return TaskModel(
            id: id,
            completed: item.completed,
            title: title,
            descriptions: descriptions,
            offset: item.offset,
            timestamp: timestamp
        )
    }

    func saveContext() throws {
        try context.save()
    }

    func findIdFromObjectIdsMap(for item: Item) -> Int? {
        context.performAndWait {
            objectIdToId.first { (key, value) in
                value.uriRepresentation() == item.objectID.uriRepresentation()
            }?.key
        }
    }
    
    func invalidateObjectIdsMap(_ item: [NSManagedObjectID]) {
        context.performAndWait {
            objectIdToId.removeAll(keepingCapacity: true)
            item.enumerated().forEach { (index, item) in
                self.objectIdToId[index] = item
            }
        }
    }

    func findItem(with id: Int) throws -> Item? {
        try context.performAndWait {
            guard let id = self.objectIdToId[id] else { return nil }

            let request = Item.fetchRequest()
            request.predicate = NSPredicate(format: "SELF = %@", id)
            request.fetchLimit = 1

            return try self.context.fetch(request).first
        }
    }
}
