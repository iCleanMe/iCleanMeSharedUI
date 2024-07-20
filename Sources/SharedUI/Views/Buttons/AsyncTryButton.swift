//
//  AsyncTryButton.swift
//  
//
//  Created by Nikolai Nobadi on 6/29/24.
//

import SwiftUI
import NnSwiftUIKit

public struct AsyncTryButton<Label>: View where Label: View {
    @ViewBuilder var label: () -> Label
    
    let role: NnButtonRole?
    let action: () async throws -> Void
    
    public init(action: @escaping () async throws -> Void, role: NnButtonRole? = nil, label: @escaping () -> Label) {
        self.action = action
        self.label = label
        self.role = role
    }
    
    public var body: some View {
        NnAsyncTryButton(action: action, label: label)
    }
}


// MARK: - Init
public extension AsyncTryButton where Label == Text {
    init<S>(_ title: S, role: NnButtonRole? = nil, action: @escaping () async throws -> Void) where S: StringProtocol {
        self.init(action: action, role: role, label: { Text(title) })
    }
}

