//
//  CleanButtonStyle.swift
//  
//
//  Created by Nikolai Nobadi on 7/3/24.
//

import SwiftUI

public struct CleanButtonStyle: ButtonStyle {
    let style: Font.TextStyle
    let textColor: Color
    let gradientType: GradientType
    let disabled: Bool
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .frame(maxWidth: .infinity)
            .withFont(style, textColor: textColor, autoSizeLineLimit: 1)
            .withGradientBackground(gradientType)
            .cornerRadius(8)
            .shadow(color: .black, radius: 4, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .disabled(disabled)
            .opacity(disabled ? 0.5 : 1)
    }
}

public extension ButtonStyle where Self == CleanButtonStyle {
    static func cleanButtonStyle(_ style: Font.TextStyle = .body, textColor: Color = .white, gradientType: GradientType = .seaNight, disabled: Bool = false) -> CleanButtonStyle {
        return .init(style: style, textColor: textColor, gradientType: gradientType, disabled: disabled)
    }
}
