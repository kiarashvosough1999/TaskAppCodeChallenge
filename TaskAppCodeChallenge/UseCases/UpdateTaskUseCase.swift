//
//  UpdateTaskUseCase.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation

protocol UpdateTaskUseCaseProtocol {
    func updateTasks(with model: TaskModel) throws
}
