//
//  Date+Extensions.swift
//
//
//  Created by Nikolai Nobadi on 7/11/24.
//

import Foundation
import NnSwiftUIKit

public extension Date {
    static func createDate(month: Int, day: Int, year: Int? = nil) -> Date {
        return nnCreateDate(month: month, day: day, year: year)
    }
}
