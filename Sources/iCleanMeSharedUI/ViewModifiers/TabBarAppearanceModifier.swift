//
//  TabBarAppearanceModifier.swift
//
//
//  Created by Nikolai Nobadi on 7/3/24.
//

#if canImport(UIKit)
import UIKit
import SwiftUI

struct TabBarAppearanceModifier: ViewModifier {
    init() {
        let appearance = UITabBarAppearance()
        let itemAppearance = UITabBarItemAppearance()
        
        // Set font and color for normal (unselected) state
        itemAppearance.normal.titleTextAttributes = [
            .font: UIFont(name: .detailFont, size: 12)!,
            .foregroundColor: UIColor.black
        ]
        
        // Set font and color for selected state
        itemAppearance.selected.iconColor = .white
        itemAppearance.selected.titleTextAttributes = [
            .font: UIFont(name: .detailFont, size: 15)!,
            .foregroundColor: UIColor.white
        ]
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundImage = .gradientImage(height: 40)
        appearance.stackedLayoutAppearance = itemAppearance
        
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func body(content: Content) -> some View {
        content
    }
}

public extension View {
    func applyTabBarStyle() -> some View {
        self.modifier(TabBarAppearanceModifier())
    }
}
#endif
