//
//  RoundedRectangleBackground.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import SwiftUI

struct TextFieldOverlay: ViewModifier {

    func body(content: Self.Content) -> some View {
        content
            .foregroundColor(Color.black)
            .padding()
            .overlay(overlay)
            .background(Color.white)
            .cornerRadius(10)
    }
    private var overlay: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(.black, lineWidth: 1)
    }
}

extension View {
    func textfieldOverlay() -> some View {
        self.modifier(TextFieldOverlay())
    }
}
