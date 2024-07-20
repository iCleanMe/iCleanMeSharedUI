//
//  InAppLoadingViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 7/2/24.
//

import SwiftUI

struct InAppLoadingViewModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        if isLoading {
            VStack {
                Text("Loading data...")
                    .withFont(.headline, textColor: .darkBlue)
            }
            .mainBackground(alignment: .center)
        } else {
            content
        }
    }
}

public extension View {
    func showsLoadingView(when isLoading: Bool) -> some View {
        modifier(InAppLoadingViewModifier(isLoading: isLoading))
    }
}
