//
//  GradientType.swift
//
//
//  Created by Nikolai Nobadi on 6/29/24.
//

import SwiftUI

public enum GradientType {
    case lightToDark
    case darkToLight
    case seaNight
    case seaNightText
    case sunset
    case sunsetLightToDark
}


// MARK: - Helpers
public extension GradientType {
    var gradient: LinearGradient {
        return .init(stops: makeStops(), startPoint: .leading, endPoint: .trailing)
    }
    
    var colors: [(CGFloat, CGFloat, CGFloat)] {
        switch self {
        case .lightToDark:
            return [(214, 237, 255), (182, 218, 247), (151, 200, 240), (120, 181, 232)]
        case .darkToLight:
            return [(151, 200, 240), (182, 218, 247)]
        case .seaNight:
            return [(25, 25, 112), (100, 149, 237), (25, 25, 112)]
        case .seaNightText:
            return [(25, 25, 112), (100, 149, 237), (25, 25, 112), (100, 149, 237), (25, 25, 112)]
        case .sunset:
            return [(255, 99, 71), (255, 0, 0), (139, 0, 0)]
        case .sunsetLightToDark:
            return [(255, 99, 71), (255, 255, 255)]
        }
    }

    func makeStops() -> [Gradient.Stop] {
        var stops: [Gradient.Stop] = []
        let step = 1.0 / Double(colors.count - 1)
        for i in 0..<colors.count {
            let position = Double(i) * step
            let color = Color(red: Double(colors[i].0) / 255.0,
                              green: Double(colors[i].1) / 255.0,
                              blue: Double(colors[i].2) / 255.0)
            stops.append(.init(color: color, location: CGFloat(position)))
        }
        
        return stops
    }
}
