//
//  NSLayoutConstraint+Layout.swift
//  LayoutExtension
//
//  Created by Ariel Bogdziewicz on 26/09/2020.
//

import UIKit

public extension NSLayoutConstraint {

    // MARK: - Active state

    func activate() -> NSLayoutConstraint {
        self.isActive = true
        return self
    }

    func deactivate() -> NSLayoutConstraint {
        self.isActive = false
        return self
    }
}
