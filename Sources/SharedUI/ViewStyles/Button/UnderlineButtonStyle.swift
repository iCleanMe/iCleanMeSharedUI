//
//  UnderlineButtonStyle.swift
//  
//
//  Created by Nikolai Nobadi on 7/3/24.
//

import SwiftUI

public struct UnderlineButtonStyle: ButtonStyle {
    let style: Font.TextStyle
    let textColor: Color

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .underline()
            .withFont(style, textColor: textColor)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

public extension ButtonStyle where Self == UnderlineButtonStyle {
    static func underlineButtonStyle(_ style: Font.TextStyle = .caption, textColor: Color = .darkBlue) -> UnderlineButtonStyle {
        return .init(style: style, textColor: textColor)
    }
}
