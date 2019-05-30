//
//  UIView+Layout.swift
//  LayoutExtension
//
//  Created by Ariel Bogdziewicz on 30/05/2019.
//

import UIKit

public extension UIView {
    
    // MARK: - Subviews
    
    func addSubview(_ view: UIView, completion: (_ view: UIView) -> Void) {
        self.addSubview(view)
        completion(view)
    }
    
    func insertSubview(_ view: UIView, at: Int, completion: (_ view: UIView) -> Void) {
        self.insertSubview(view, at: at)
        completion(view)
    }
    
    func insertSubview(_ view: UIView, belowSubview: UIView, completion: (_ view: UIView) -> Void) {
        self.insertSubview(view, belowSubview: belowSubview)
        completion(view)
    }
    
    func insertSubview(_ view: UIView, aboveSubview: UIView, completion: (_ view: UIView) -> Void) {
        self.insertSubview(view, aboveSubview: aboveSubview)
        completion(view)
    }
    
    // MARK: - Size
    
    @discardableResult
    func width(_ width: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(equalToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func height(_ height: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(equalToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Size to other size
    
    @discardableResult
    func width(_ width: CGFloat = 0.0, to anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: width)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func height(_ height: CGFloat = 0.0, to anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: height)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Constraints equal to parent
    
    @discardableResult
    func left(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(equalTo: self.superview!.leftAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func top(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func right(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(equalTo: self.superview!.rightAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func bottom(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func fill(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> (top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint) {
        let top = self.top(inset, priority: priority)
        let left = self.left(inset, priority: priority)
        let bottom = self.bottom(-inset, priority: priority)
        let right = self.right(-inset, priority: priority)
        return (top: top, left: left, bottom: bottom, right: right)
    }
    
    // MARK: - Safe constraints equal to parent
    
    @discardableResult
    func leftSafe(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            let constraint = self.leftAnchor.constraint(
                equalTo: self.superview!.safeAreaLayoutGuide.leftAnchor,
                constant: offset)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        } else {
            return self.left(offset, priority: priority)
        }
    }
    
    @discardableResult
    func topSafe(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            let constraint = self.topAnchor.constraint(
                equalTo: self.superview!.safeAreaLayoutGuide.topAnchor,
                constant: offset)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        } else {
            return self.top(offset, priority: priority)
        }
    }
    
    @discardableResult
    func rightSafe(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            let constraint = self.rightAnchor.constraint(
                equalTo: self.superview!.safeAreaLayoutGuide.rightAnchor,
                constant: offset)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        } else {
            return self.right(offset, priority: priority)
        }
    }
    
    @discardableResult
    func bottomSafe(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            let constraint = self.bottomAnchor.constraint(
                equalTo: self.superview!.safeAreaLayoutGuide.bottomAnchor,
                constant: offset)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        } else {
            return self.bottom(offset, priority: priority)
        }
    }
    
    // MARK: - Constraints equal to view
    
    @discardableResult
    func left(_ offset: CGFloat = 0.0, to view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(equalTo: view.rightAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func top(_ offset: CGFloat = 0.0, to view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func right(_ offset: CGFloat = 0.0, to view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(equalTo: view.leftAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func bottom(_ offset: CGFloat = 0.0, to view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Constraints equal to anchor
    
    @discardableResult
    func left(_ offset: CGFloat = 0.0, to anchor: NSLayoutXAxisAnchor, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func top(_ offset: CGFloat = 0.0, to anchor: NSLayoutYAxisAnchor, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func right(_ offset: CGFloat = 0.0, to anchor: NSLayoutXAxisAnchor, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func bottom(_ offset: CGFloat = 0.0, to anchor: NSLayoutYAxisAnchor, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Constraints equal to safe area
    
    @discardableResult
    func leftSafe(_ offset: CGFloat = 0.0, to view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: offset)
        } else {
            constraint = self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func topSafe(_ offset: CGFloat = 0.0, to view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offset)
        } else {
            constraint = self.topAnchor.constraint(equalTo: view.topAnchor, constant: offset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func rightSafe(_ offset: CGFloat = 0.0, to view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: offset)
        } else {
            constraint = self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: offset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func bottomSafe(_ offset: CGFloat = 0.0, to view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: offset)
        } else {
            constraint = self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: offset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Constraints equal to view controller
    
    @discardableResult
    @available(iOS, deprecated: 11.0)
    func leftSafe(_ offset: CGFloat = 0.0, to viewController: UIViewController, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.leftAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.leftAnchor, constant: offset)
        } else {
            constraint = self.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: offset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    @available(iOS, deprecated: 11.0)
    func topSafe(_ offset: CGFloat = 0.0, to viewController: UIViewController, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.topAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor, constant: offset)
        } else {
            constraint = self.topAnchor.constraint(equalTo: viewController.topLayoutGuide.bottomAnchor, constant: offset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    @available(iOS, deprecated: 11.0)
    func rightSafe(_ offset: CGFloat = 0.0, to viewController: UIViewController, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.rightAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.rightAnchor, constant: offset)
        } else {
            constraint = self.rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: offset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    @available(iOS, deprecated: 11.0)
    func bottomSafe(_ offset: CGFloat = 0.0, to viewController: UIViewController, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.bottomAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.bottomAnchor, constant: offset)
        } else {
            constraint = self.bottomAnchor.constraint(equalTo: viewController.bottomLayoutGuide.topAnchor, constant: offset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Center equal to parent
    
    @discardableResult
    func centerX(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerY(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func center(_ offset: CGPoint = CGPoint.zero, priority: UILayoutPriority = .required) -> (x: NSLayoutConstraint, y: NSLayoutConstraint) {
        let x = self.centerX(offset.x, priority: priority)
        let y = self.centerY(offset.y, priority: priority)
        return (x: x, y: y)
    }
    
    // MARK: - Center equal to view
    
    @discardableResult
    func centerX(_ offset: CGFloat = 0.0, to view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerY(_ offset: CGFloat = 0.0, to view: UIView, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func center(_ offset: CGPoint = CGPoint.zero, to view: UIView, priority: UILayoutPriority = .required) -> (x: NSLayoutConstraint, y: NSLayoutConstraint) {
        let x = self.centerX(offset.x, to: view, priority: priority)
        let y = self.centerY(offset.y, to: view, priority: priority)
        return (x: x, y: y)
    }
    
    // MARK: - Center equal to anchor
    
    @discardableResult
    func centerX(_ offset: CGFloat = 0.0, to anchor: NSLayoutXAxisAnchor, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerY(_ offset: CGFloat = 0.0, to anchor: NSLayoutYAxisAnchor, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
}
