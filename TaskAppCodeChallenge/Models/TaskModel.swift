//
//  TaskModel.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import Foundation

struct TaskModel: Identifiable, Equatable {
    let id: Int
    var completed: Bool
    let descriptions: String
    var offset: Int16
    let timestamp: Date
    let title: String

    init(id: Int = 0,
         completed: Bool = false,
         title: String,
         descriptions: String,
         offset: Int16 = 0,
         timestamp: Date = Date()
    ) {
        self.id = id
        self.completed = completed
        self.descriptions = descriptions
        self.offset = offset
        self.timestamp = timestamp
        self.title = title
    }
}
