//
//  CreateTaskUseCaseTests.swift
//  TaskAppCodeChallengeTests
//
//  Created by Kiarash Vosough on 6/11/23.
//

import XCTest
@testable import TaskAppCodeChallenge

final class CreateTaskUseCaseTests: XCTestCase {

    private var sut: (CreateTaskUseCaseProtocol&FetchTaskUseCaseProtocol)!
    
    override func setUpWithError() throws {
        sut = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_create_task() throws {
        let title = "test1"
        let descriptions = "describtion 1"

        let task = TaskModel(title: title, descriptions: descriptions)
        XCTAssertNoThrow(try sut.createTasks(with: task))
        
        let fetchTask = try sut.fetchTasks().first
        
        XCTAssertNotNil(fetchTask)
        XCTAssertEqual(fetchTask?.title, title)
        XCTAssertEqual(fetchTask?.descriptions, descriptions)
    }

    func test_fetch_task_empty() throws {
        let fetchTask = try sut.fetchTasks()
        
        XCTAssertEqual(fetchTask.count, 0)
    }
}
