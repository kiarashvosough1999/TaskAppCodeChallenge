//
//  FeaturePreview.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 4/23/23.
//

import SwiftUI

struct FeaturePreview: View {

    @Binding private var isPresented: Bool

    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }

    var body: some View {
        VStack {
            Group {
                Text("App Features:")
                    .bold()
                Group {
                    Text("Built With SwiftUI")
                    Text("Drag And Drop")
                    Text("Local Persistence")
                    Text("Filter Tasks")
                    Text("Add And Remove Tasks")
                    Text("Preview Tasks")
                }
                .padding(.top)
            }
            .frame(alignment: .center)
            Button("Ok") {
                isPresented.toggle()
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .bottom)
        }
    }
}
