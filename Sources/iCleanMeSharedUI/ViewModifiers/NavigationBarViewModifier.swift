//
//  NavigationBarViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 7/3/24.
//

#if canImport(UIKit)
import SwiftUI

struct NavigationBarViewModifier: ViewModifier {
    init(tint: Color = .white) {
        let appearance = UINavigationBarAppearance()

        appearance.configureWithOpaqueBackground()
        appearance.backgroundImage = .gradientImage(height: 40)
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: .boldFont, size: 25.0)!, // TODO: - find a way to make this dynamic pending on text
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        appearance.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: .boldFont, size: 40.0)!, // TODO: - find a way to make this dynamic pending on text
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .init(tint)
    }
    
    func body(content: Content) -> some View {
        content
              // MARK: - none of this shit works when navigating forward and back
//            .toolbarColorScheme(.dark, for: .navigationBar)
//            .toolbarBackground(.visible, for: .navigationBar)
//            .toolbarBackground(Color.darkGreen, for: .navigationBar)
    }
}

public extension View {
    func applyNavigationBarStyle() -> some View {
        self.modifier(NavigationBarViewModifier())
    }
}
#endif
