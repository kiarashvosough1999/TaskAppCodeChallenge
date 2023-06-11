//
//  TextFieldTopTextModifier.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import SwiftUI

internal struct TextFieldTopTextModifier: ViewModifier {

    private let title: String

    internal init(title: String) {
        self.title = title
    }

    internal func body(content: Content) -> some View {
        VStack(alignment: .center, spacing: 7) {
            Text(title)
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.black)
                .padding(.leading, 10)
                .frame(maxWidth: .infinity, alignment: .center)
            content
        }
    }
}

extension View {

    public func textFieldTopText(title: String) -> some View {
        self.modifier(TextFieldTopTextModifier(title: title))
    }
}
