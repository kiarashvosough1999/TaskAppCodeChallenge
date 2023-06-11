//
//  FetchTaskUseCase.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation
import CoreData

protocol FetchTaskUseCaseProtocol {
    func fetchTasks() throws -> [TaskModel]
}
