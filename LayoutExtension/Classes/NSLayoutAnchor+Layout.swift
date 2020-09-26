//
//  NSLayoutAnchor+Layout.swift
//  LayoutExtension
//
//  Created by Ariel Bogdziewicz on 26/09/2020.
//

import UIKit

@objc public extension NSLayoutAnchor {

    func equal(to anchor: NSLayoutAnchor<AnchorType>, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func less(than anchor: NSLayoutAnchor<AnchorType>, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func greater(than anchor: NSLayoutAnchor<AnchorType>, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
}
