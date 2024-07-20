//
//  Image+Extensions.swift
//
//
//  Created by Nikolai Nobadi on 7/5/24.
//

import SwiftUI

public extension Image {
    static var holdMop: Image {
        return makeMascotImage(.holdMop)
    }
    
    static var readyMop: Image {
        return makeMascotImage(.readyMop)
    }
}

extension Image {
    static func makeMascotImage(_ mascot: MascotImage) -> Image {
        return Image(mascot.rawValue, bundle: .module, label: Text(mascot.accessibilityLabel))
    }
}


// MARK: - Dependencies
enum MascotImage: String {
    case readyMop, holdMop
    
    var accessibilityLabel: String {
        switch self {
        case .readyMop:
            return "An illustrated figure holding a mop over should and bucket on ground."
        case .holdMop:
            return "An illustrated figure holding a mop and bucket."
        }
    }
}

