//
//  CustomModalViewModifier.swift
//
//
//  Created by Nikolai Nobadi on 7/19/24.
//

import SwiftUI

// TODO: - Move to NnSwiftUIKit
struct CustomModalViewModifier<Modal: View>: ViewModifier {
    @Binding var isPresented: Bool
    
    let modal: () -> Modal
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            ZStack {
                Color.black.opacity(0.4).ignoresSafeArea()
                modal()
            }
            .onlyShow(when: isPresented)
        }
    }
}

public extension View {
    func withCustomModal<Modal: View>(isPresented: Binding<Bool>, @ViewBuilder modal: @escaping () -> Modal) -> some View {
        modifier(CustomModalViewModifier(isPresented: isPresented, modal: modal))
    }
}
