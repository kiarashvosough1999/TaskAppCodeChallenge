//
//  CreateTaskUseCase.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation

protocol CreateTaskUseCaseProtocol {
    func createTasks(with model: TaskModel) throws
}
