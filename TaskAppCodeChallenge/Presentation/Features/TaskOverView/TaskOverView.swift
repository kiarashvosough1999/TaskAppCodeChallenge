//
//  TaskOverView.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import SwiftUI

struct TaskOverView: View {

    @ObservedObject private var viewModel: TaskOverViewModel

    init(viewModel: TaskOverViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text(viewModel.task.title)
                .textfieldOverlay()
                .textFieldTopText(title: "Title")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            Text(viewModel.task.descriptions)
                .textfieldOverlay()
                .textFieldTopText(title: "Description")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            
            Text(viewModel.task.timestamp.description)
                .textfieldOverlay()
                .textFieldTopText(title: "DateCreated")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
        }
    }
}
