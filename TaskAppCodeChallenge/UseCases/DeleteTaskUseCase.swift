//
//  DeleteTaskUseCase.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation

protocol DeleteTaskUseCaseProtocol {
    func deleteTask(_ task: TaskModel) throws
}
