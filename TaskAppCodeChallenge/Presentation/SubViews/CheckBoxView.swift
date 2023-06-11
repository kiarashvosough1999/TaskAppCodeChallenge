//
//  CheckBoxView.swift
//  TaskAppCodeChallenge
//
//  Created by Kiarash Vosough on 6/11/23.
//

import SwiftUI

struct CheckBoxView: View {

    private let checked: Bool
    private let onTap: () -> Void

    init(checked: Bool, onTap: @escaping () -> Void) {
        self.checked = checked
        self.onTap = onTap
    }

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(.systemBlue) : Color.secondary)
            .onTapGesture {
                onTap()
            }
    }
}
