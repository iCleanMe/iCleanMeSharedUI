//
//  LoginIconView.swift
//  
//
//  Created by Nikolai Nobadi on 7/2/24.
//

#if canImport(UIKit)
import UIKit
import SwiftUI

public struct LoginIconView: View {
    public init() { }
    
    public var body: some View {
        Image.holdMop
            .resizable()
            .frame(width: getHeightPercent(30), height: getHeightPercent(30))
            .padding(10)
            .offset(x: 7) // to center 3dman
            .withGradientBackground(.seaNight)
            .clipShape(Circle())
            .shadow(color: .primary, radius: 2)
    }
}


// MARK: - Preview
#Preview {
    LoginIconView()
}
#endif
