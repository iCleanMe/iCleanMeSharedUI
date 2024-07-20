//
//  NumberedVStack.swift
//
//
//  Created by Nikolai Nobadi on 7/19/24.
//

import SwiftUI

public struct NumberedVStack: View {
    let items: [String]
    let alignment: HorizontalAlignment
    
    public init(items: [String], alignment: HorizontalAlignment = .leading) {
        self.items = items
        self.alignment = alignment
    }
    
    public var body: some View {
        VStack(alignment: alignment) {
            ForEach(items.indices, id: \.self) { index in
                HStack(alignment: .center) {
                    Text("\(index + 1).")
                        .withFont()
                    Text(items[index])
                        .withFont(.caption, isDetail: true, autoSizeLineLimit: 1)
                }
                    
            }
        }
    }
}
