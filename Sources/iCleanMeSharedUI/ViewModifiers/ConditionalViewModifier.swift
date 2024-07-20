//
//  ConditionalViewModifier.swift
//
//
//  Created by Nikolai Nobadi on 7/19/24.
//

import SwiftUI

// TODO: - Move to NnSwiftUIKit
struct ConditionalViewModifier<Conditional: View>: ViewModifier {
    let isShowing: Bool
    let conditionalView: () -> Conditional
    
    func body(content: Content) -> some View {
        if isShowing {
            conditionalView()
        } else {
            content
        }
    }
}

public extension View {
    func showingConditionalView<V: View>(isShowing: Bool, @ViewBuilder conditionalView: @escaping () -> V) -> some View {
        modifier(ConditionalViewModifier(isShowing: isShowing, conditionalView: conditionalView))
    }
}
