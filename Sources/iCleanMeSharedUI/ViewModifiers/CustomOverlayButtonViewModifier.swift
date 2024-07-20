//
//  CustomOverlayButtonViewModifier.swift
//
//
//  Created by Nikolai Nobadi on 7/19/24.
//

import SwiftUI

// TODO: - Move to NnSwiftUIKit
struct CustomOverlayButtonViewModifier: ViewModifier {
    let tint: Color
    let alignment: Alignment
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: alignment) {
                Button(action: action) {
                    Image(systemName: "xmark")
                        .bold()
                        .foregroundStyle(tint)
                }
            }
    }
}

public extension View {
    func withOverlayButton(tint: Color = .black, alignment: Alignment = .topTrailing, action: @escaping () -> Void) -> some View {
        modifier(CustomOverlayButtonViewModifier(tint: tint, alignment: alignment, action: action))
    }
}
