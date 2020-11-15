//
//  NSLayoutDimension+Layout.swift
//  LayoutExtension
//
//  Created by Ariel Bogdziewicz on 26/09/2020.
//

import UIKit

public extension NSLayoutDimension {

    // MARK: - Dimension to constant

    func equal(_ constant: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func less(_ constant: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func greater(_ constant: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Dimension to another dimension

    func equal(to anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func less(than anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func greater(than anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
}
