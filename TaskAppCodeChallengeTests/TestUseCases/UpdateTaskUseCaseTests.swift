//
//  UpdateTaskUseCaseTests.swift
//  TaskAppCodeChallengeTests
//
//  Created by Kiarash Vosough on 6/11/23.
//

import XCTest
@testable import TaskAppCodeChallenge

final class UpdateTaskUseCaseTests: XCTestCase {

    private var sut: (CreateTaskUseCaseProtocol&FetchTaskUseCaseProtocol&UpdateTaskUseCaseProtocol)!
    
    override func setUpWithError() throws {
        sut = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_update_task() throws {
        let title = "test1"
        let descriptions = "describtion 1"
        let newOffset: Int16 = 10

        var task = TaskModel(title: title, descriptions: descriptions)
        XCTAssertNoThrow(try sut.createTasks(with: task))
        
        let fetchTask = try sut.fetchTasks().first
        
        XCTAssertNotNil(fetchTask)
        XCTAssertEqual(fetchTask?.title, title)
        XCTAssertEqual(fetchTask?.descriptions, descriptions)
        
        task.offset = newOffset
        
        XCTAssertNoThrow(try sut.updateTasks(with: task))
        
        let updatedTask = try sut.fetchTasks().first
        
        XCTAssertNotNil(updatedTask)
        XCTAssertEqual(updatedTask?.title, title)
        XCTAssertEqual(updatedTask?.offset, newOffset)
        XCTAssertEqual(updatedTask?.descriptions, descriptions)
    }

    func test_update_task_error() throws {
        let title = "test1"
        let descriptions = "describtion 1"

        let task = TaskModel(title: title, descriptions: descriptions)
        
        XCTAssertThrowsError(try sut.updateTasks(with: task))
    }
}
