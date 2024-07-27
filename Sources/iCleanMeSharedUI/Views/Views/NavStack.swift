//
//  NavStack.swift
//  
//
//  Created by Nikolai Nobadi on 7/3/24.
//

#if canImport(UIKit)
import SwiftUI
import NnSwiftUIKit

public struct NavStack<Content: View>: View {
    let title: String
    let content: () -> Content
    let displayMode: NavigationBarItem.TitleDisplayMode
    var path: Binding<NavigationPath>?
    
    public init(path: Binding<NavigationPath>? = nil, title: String = "", displayMode: NavigationBarItem.TitleDisplayMode = .inline, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
        self.displayMode = displayMode
        self.path = path
    }
    
    public var body: some View {
        NnSwiftUIKit.NavStack(path: path, title: title, displayMode: displayMode, content: content)
            .applyNavigationBarStyle()
            .tint(.white)
    }
}


public struct CustomPathNavStack<Data, Content: View>: View where Data: MutableCollection, Data: RandomAccessCollection, Data: RangeReplaceableCollection, Data.Element: Hashable {
    @Binding var path: Data
    
    let title: String?
    let displayMode: NavigationBarItem.TitleDisplayMode
    let content: () -> Content
    
    public init(path: Binding<Data>, title: String? = nil, displayMode: NavigationBarItem.TitleDisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) {
        self._path = path
        self.title = title
        self.displayMode = displayMode
        self.content = content
    }
    
    public var body: some View {
        NnSwiftUIKit.CustomPathNavStack(path: $path, title: title, displayMode: displayMode, content: content)
            .applyNavigationBarStyle()
            .tint(.white)
    }
}
#endif
