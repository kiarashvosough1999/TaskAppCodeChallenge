//
//  TaskModelMocks.swift
//  TaskAppCodeChallengeTests
//
//  Created by Kiarash Vosough on 6/11/23.
//

@testable import TaskAppCodeChallenge

extension TaskModel {
    
    static var mock: [TaskModel] {
        [
            TaskModel(title: "title 1", descriptions: "descriptions 1"),
            TaskModel(title: "title 2", descriptions: "descriptions 2"),
            TaskModel(title: "title 3", descriptions: "descriptions 13"),
            TaskModel(title: "title 4", descriptions: "descriptions 14"),
            TaskModel(title: "title 5", descriptions: "descriptions 15"),
            TaskModel(title: "title 6", descriptions: "descriptions 16"),
            TaskModel(title: "title 7", descriptions: "descriptions 17"),
            TaskModel(title: "title 8", descriptions: "descriptions 18"),
        ]
    }
}
