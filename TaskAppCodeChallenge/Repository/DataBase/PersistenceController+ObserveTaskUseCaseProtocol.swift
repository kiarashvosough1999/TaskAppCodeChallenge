//
//  PersistenceController+ObserveTaskUseCaseProtocol.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Combine
import Foundation

extension PersistenceController: ObserveTaskUseCaseProtocol {

    var tasksDidChanged: AnyPublisher<Void, Never> {
        NotificationCenter
            .default
            .publisher(for: .NSManagedObjectContextDidSave, object: context)
            .map { _ in () }
            .eraseToAnyPublisher()
    }
}
