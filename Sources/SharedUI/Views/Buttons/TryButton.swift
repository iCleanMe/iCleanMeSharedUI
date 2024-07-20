//
//  TryButton.swift
//
//
//  Created by Nikolai Nobadi on 6/29/24.
//

import SwiftUI
import NnSwiftUIKit

public struct TryButton<Label>: View where Label: View {
    @ViewBuilder var label: () -> Label
    
    let role: NnButtonRole?
    let action: () throws -> Void
    
    public var body: some View {
        NnTryButton(action: action, role: role, label: label)
    }
}


// MARK: - Helper Init
public extension TryButton where Label == Text {
    init<S>(_ title: S, role: NnButtonRole? = nil, action: @escaping () throws -> Void) where S: StringProtocol {
        self.init(label: { Text(title) }, role: role, action: action)
    }
}
