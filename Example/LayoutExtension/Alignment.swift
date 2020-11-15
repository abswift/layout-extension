//
//  Alignment.swift
//  LayoutExtension_Example
//
//  Created by Ariel Bogdziewicz on 15/11/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

struct Alignment: OptionSet, Hashable {
    let rawValue: Int

    static let left     = Alignment(rawValue: 1 << 0)
    static let top      = Alignment(rawValue: 1 << 1)
    static let right    = Alignment(rawValue: 1 << 2)
    static let bottom   = Alignment(rawValue: 1 << 3)
    static let centerX  = Alignment(rawValue: 1 << 4)
    static let centerY  = Alignment(rawValue: 1 << 5)

    static let none: Alignment = []

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }

    var title: String {
        let all: [Alignment] = [.left, .centerX, .right, .top, .centerY, .bottom]
        return all.filter { alignment in
            return self.contains(alignment)
        }.compactMap { alignment in
            switch alignment {
            case Alignment.left:
                return "LEFT"
            case Alignment.centerX:
                return "CENTER-X"
            case Alignment.right:
                return "RIGHT"
            case Alignment.top:
                return "TOP"
            case Alignment.centerY:
                return "CENTER-Y"
            case Alignment.bottom:
                return "BOTTOM"
            default:
                return nil
            }
        }.joined(separator: " | ")
    }

    func containsAtLeastTwo(from values: [Alignment]) -> Bool {
        for value1 in values {
            for value2 in values {
                guard value1 != value2 else {
                    continue
                }

                if self.contains([value1, value2]) {
                    return true
                }
            }
        }
        return false
    }
}
