//
//  TaskAppCodeChallengeApp.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import SwiftUI

@main
struct TaskAppCodeChallengeApp: App {

    @AppStorage("isFirstTime") private var isFirstTime: Bool?
    @State private var preview: Bool = false
    
    let viewModel = TaskListViewModel(
        fetchTaskUseCase: PersistenceController.shared,
        createTaskUseCase: PersistenceController.shared,
        updateTaskUseCase: PersistenceController.shared,
        observeTaskUseCase: PersistenceController.shared,
        deleteTaskUseCase: PersistenceController.shared
    )

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                .sheet(isPresented: $preview) {
                    FeaturePreview(isPresented: $preview)
                }
                .onAppear {
                    if isFirstTime == true || isFirstTime == nil {
                        preview.toggle()
                        isFirstTime = false
                    }
                }
        }
    }
}

