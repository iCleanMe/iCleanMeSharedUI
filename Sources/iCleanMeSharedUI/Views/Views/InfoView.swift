//
//  InfoView.swift
//
//
//  Created by Nikolai Nobadi on 7/3/24.
//

import SwiftUI

public struct InfoView<Header: View, Info: View>: View {
    let header: Header
    let info: Info
    
    public init(@ViewBuilder header: () -> Header, @ViewBuilder info: () -> Info) {
        self.header = header()
        self.info = info()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            header
                .frame(maxWidth: .infinity)
                .withGradientBackground(.seaNight)
            Divider()
                .background(Color.primary)
            info
                .frame(maxWidth: .infinity)
        }
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black))
        .shadow(color: .primary, radius: 1)
    }
}
