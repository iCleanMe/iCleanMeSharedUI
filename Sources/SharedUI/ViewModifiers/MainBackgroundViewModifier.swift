//
//  MainBackgroundViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 7/2/24.
//

import SwiftUI

struct MainBackgroundViewModifier: ViewModifier {
    let alignment: Alignment
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .withGradientBackground(.lightToDark)
    }
}

public extension View {
    func mainBackground(alignment: Alignment = .top) -> some View {
        modifier(MainBackgroundViewModifier(alignment: alignment))
    }
}
