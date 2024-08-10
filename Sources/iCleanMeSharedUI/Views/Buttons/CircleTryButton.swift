//
//  CircleTryButton.swift
//
//
//  Created by Nikolai Nobadi on 8/10/24.
//

import SwiftUI
import NnSwiftUIKit

public struct CircleTryButton: View {
    let gradient: GradientType
    let accessibilityId: String?
    let action: () throws -> Void
    
    public init(gradient: GradientType = .seaNight, accessibilityId: String? = nil, action: @escaping () throws -> Void) {
        self.gradient = gradient
        self.accessibilityId = accessibilityId
        self.action = action
    }
    
    private var buttonSize: CGFloat {
        #if canImport(UIKit)
        return getHeightPercent(isSmallPhone ? 8 : 6)
        #else
        return getHeightPercent(6)
        #endif
    }
    
    public var body: some View {
        TryButton(action: action) {
            Image(systemName: "plus")
                .withFont(.title3, textColor: .white)
        }
        .nnSetAccessibiltyId(accessibilityId)
        .frame(maxWidth: buttonSize, maxHeight: buttonSize)
        .withGradientBackground(gradient)
        .clipShape(Circle())
        .shadow(color: .primary, radius: 7)
    }
}
