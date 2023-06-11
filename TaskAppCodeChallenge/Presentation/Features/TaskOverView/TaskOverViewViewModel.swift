//
//  TaskOverViewViewModel.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation

final class TaskOverViewModel: ObservableObject {
    
    let task: TaskModel

    init(task: TaskModel) {
        self.task = task
    }
}
