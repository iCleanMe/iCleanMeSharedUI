//
//  CleanFieldStyle.swift
//
//
//  Created by Nikolai Nobadi on 7/5/24.
//

import SwiftUI

public struct CleanFieldStyle: TextFieldStyle {
    let alignment: TextAlignment
    let keyboardType: UIKeyboardType
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .tint(.blue)
            .keyboardType(keyboardType)
            .autocapitalization(.none)
            .autocorrectionDisabled(true)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(alignment)
    }
}

public extension TextFieldStyle where Self == CleanFieldStyle {
    static func cleanFieldStyle(alignment: TextAlignment = .center, keyboardType: UIKeyboardType = .alphabet) -> CleanFieldStyle {
        return .init(alignment: alignment, keyboardType: keyboardType)
    }
}
