//
//  ObserveTaskUseCase.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Combine

protocol ObserveTaskUseCaseProtocol {
    var tasksDidChanged: AnyPublisher<Void, Never> { get }
}
