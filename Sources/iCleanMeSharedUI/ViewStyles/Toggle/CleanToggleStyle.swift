//
//  CleanToggleStyle.swift
//
//
//  Created by Nikolai Nobadi on 7/10/24.
//

import SwiftUI

public struct CleanToggleStyle: ToggleStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
                
            Spacer()
            RoundedRectangle(cornerRadius: 16, style: .circular)
                .fill(configuration.isOn ? Color.darkBlue : Color.cleanRed)
                .frame(width: 50, height: 30)
                .overlay(
                    Circle()
                        .fill(.white)
                        .padding(2)
                        .offset(x: configuration.isOn ? 10 : -10)
                )
                .onTapGesture {
                    withAnimation(.smooth(duration: 0.2)) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}

public extension ToggleStyle where Self == CleanToggleStyle {
    static func cleanToggleStyle() -> CleanToggleStyle {
        return .init()
    }
}

