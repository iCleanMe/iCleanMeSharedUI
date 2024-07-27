//
//  CleanFieldStyle.swift
//
//
//  Created by Nikolai Nobadi on 7/5/24.
//

import SwiftUI

public struct CleanFieldStyle: TextFieldStyle {
    let alignment: TextAlignment
    
    #if canImport(UIKit)
    let keyboardType: UIKeyboardType
    #endif
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .tint(.blue)
        #if canImport(UIKit)
            .keyboardType(keyboardType)
            .autocapitalization(.none)
        #endif
            .autocorrectionDisabled(true)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(alignment)
    }
}

public extension TextFieldStyle where Self == CleanFieldStyle {
    #if canImport(UIKit)
    static func cleanFieldStyle(alignment: TextAlignment = .center, keyboardType: UIKeyboardType = .alphabet) -> CleanFieldStyle {
        return .init(alignment: alignment, keyboardType: keyboardType)
    }
    #else
    static func cleanFieldStyle(alignment: TextAlignment = .center) -> CleanFieldStyle {
        return .init(alignment: alignment)
    }
    #endif
}
