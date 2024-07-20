//
//  String+FontNames.swift
//  
//
//  Created by Nikolai Nobadi on 7/3/24.
//

public extension String {
    static var boldFont: String {
        return "MarkerFelt-Thin"
    }
    
    static var detailFont: String {
        return "HelveticaNeue"
    }
}


// MARK: - Move to NnSwiftUIKit
public extension String {
    func skipLine(_ text: String) -> String {
        return "\(self)\n\n\(text)"
    }
}
