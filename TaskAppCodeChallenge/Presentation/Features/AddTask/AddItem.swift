//
//  AddItemView.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import SwiftUI

struct AddItemView: View {
    
    @ObservedObject private var viewModel: AddTaskViewModel

    init(viewModel: AddTaskViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            TextField("Enter Title", text: $viewModel.title)
                .textfieldOverlay()
                .textFieldTopText(title: "Title")
                .frame(height: 50)
                .padding(.top, 20)
            
            TextEditor(text: $viewModel.description)
                .textfieldOverlay()
                .textFieldTopText(title: "Enter Description")
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 20)
                
            Button {
                viewModel.addTask()
            } label: {
                Text("Add Task")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .bottom)
        }
        .padding(.all)
    }
}
