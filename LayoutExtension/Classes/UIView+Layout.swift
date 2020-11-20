//
//  UIView+Layout.swift
//  LayoutExtension
//
//  Created by Ariel Bogdziewicz on 30/05/2019.
//

import UIKit

public extension UIView {

    // MARK: - Auto Layout

    var autoLayout: Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }

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
    
    // MARK: - Size constant
    
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

    // MARK: - Size less than constant

    @discardableResult
    func widthLess(_ width: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func heightLess(_ height: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(lessThanOrEqualToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Size greater than constant

    @discardableResult
    func widthGreater(_ width: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func heightGreater(_ height: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Size to anchor
    
    @discardableResult
    func width(to anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func height(to anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Size less than anchor

    @discardableResult
    func widthLess(than anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func heightLess(than anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Size greater than anchor

    @discardableResult
    func widthGreater(than anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func heightGreater(than anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Edge to parent

    @discardableResult
    func leading(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailing(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: -inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func left(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(equalTo: self.superview!.leftAnchor, constant: inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func top(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func right(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(equalTo: self.superview!.rightAnchor, constant: -inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func bottom(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: -inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Edge less than parent

    @discardableResult
    func leadingLess(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: self.superview!.leadingAnchor, constant: inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailingLess(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: self.superview!.trailingAnchor, constant: -inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func leftLess(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(lessThanOrEqualTo: self.superview!.leftAnchor, constant: inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func topLess(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(lessThanOrEqualTo: self.superview!.topAnchor, constant: inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func rightLess(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(lessThanOrEqualTo: self.superview!.rightAnchor, constant: -inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottomLess(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: self.superview!.bottomAnchor, constant: -inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Edge greater than parent

    @discardableResult
    func leadingGreater(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: self.superview!.leadingAnchor, constant: inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailingGreater(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: self.superview!.trailingAnchor, constant: -inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func leftGreater(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(greaterThanOrEqualTo: self.superview!.leftAnchor, constant: inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func topGreater(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(greaterThanOrEqualTo: self.superview!.topAnchor, constant: inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func rightGreater(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(greaterThanOrEqualTo: self.superview!.rightAnchor, constant: -inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottomGreater(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: self.superview!.bottomAnchor, constant: -inset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Fill to parent

    @discardableResult
    func fill(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> (top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint) {
        let top = self.top(inset, priority: priority)
        let left = self.left(inset, priority: priority)
        let bottom = self.bottom(inset, priority: priority)
        let right = self.right(inset, priority: priority)
        return (top: top, left: left, bottom: bottom, right: right)
    }

    @discardableResult
    func fill(_ insets: UIEdgeInsets, priority: UILayoutPriority = .required) -> (top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint) {
        let top = self.top(insets.top, priority: priority)
        let left = self.left(insets.left, priority: priority)
        let bottom = self.bottom(insets.bottom, priority: priority)
        let right = self.right(insets.right, priority: priority)
        return (top: top, left: left, bottom: bottom, right: right)
    }

    @discardableResult
    func fillLeadingTrailing(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> (top: NSLayoutConstraint, leading: NSLayoutConstraint, bottom: NSLayoutConstraint, trailing: NSLayoutConstraint) {
        let top = self.top(inset, priority: priority)
        let leading = self.leading(inset, priority: priority)
        let bottom = self.bottom(inset, priority: priority)
        let trailing = self.trailing(inset, priority: priority)
        return (top: top, leading: leading, bottom: bottom, trailing: trailing)
    }

    @discardableResult
    func fillLeadingTrailing(_ insets: UIEdgeInsets, priority: UILayoutPriority = .required) -> (top: NSLayoutConstraint, leading: NSLayoutConstraint, bottom: NSLayoutConstraint, trailing: NSLayoutConstraint) {
        let top = self.top(insets.top, priority: priority)
        let leading = self.leading(insets.left, priority: priority)
        let bottom = self.bottom(insets.bottom, priority: priority)
        let trailing = self.trailing(insets.right, priority: priority)
        return (top: top, leading: leading, bottom: bottom, trailing: trailing)
    }

    // MARK: - Edge to parent's safe area

    @discardableResult
    func leadingSafe(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            let constraint = self.leadingAnchor.constraint(
                equalTo: self.superview!.safeAreaLayoutGuide.leadingAnchor,
                constant: inset)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        } else {
            return self.leading(inset, priority: priority)
        }
    }

    @discardableResult
    func trailingSafe(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            let constraint = self.trailingAnchor.constraint(
                equalTo: self.superview!.safeAreaLayoutGuide.trailingAnchor,
                constant: -inset)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        } else {
            return self.trailing(inset, priority: priority)
        }
    }

    @discardableResult
    func leftSafe(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            let constraint = self.leftAnchor.constraint(
                equalTo: self.superview!.safeAreaLayoutGuide.leftAnchor,
                constant: inset)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        } else {
            return self.left(inset, priority: priority)
        }
    }
    
    @discardableResult
    func topSafe(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            let constraint = self.topAnchor.constraint(
                equalTo: self.superview!.safeAreaLayoutGuide.topAnchor,
                constant: inset)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        } else {
            return self.top(inset, priority: priority)
        }
    }
    
    @discardableResult
    func rightSafe(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            let constraint = self.rightAnchor.constraint(
                equalTo: self.superview!.safeAreaLayoutGuide.rightAnchor,
                constant: -inset)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        } else {
            return self.right(inset, priority: priority)
        }
    }
    
    @discardableResult
    func bottomSafe(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            let constraint = self.bottomAnchor.constraint(
                equalTo: self.superview!.safeAreaLayoutGuide.bottomAnchor,
                constant: -inset)
            constraint.priority = priority
            constraint.isActive = true
            return constraint
        } else {
            return self.bottom(inset, priority: priority)
        }
    }

    // MARK: - Fill to parent's safe area

    @discardableResult
    func fillSafe(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> (top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint) {
        let top = self.topSafe(inset, priority: priority)
        let left = self.leftSafe(inset, priority: priority)
        let bottom = self.bottomSafe(inset, priority: priority)
        let right = self.rightSafe(inset, priority: priority)
        return (top: top, left: left, bottom: bottom, right: right)
    }

    @discardableResult
    func fillSafe(_ insets: UIEdgeInsets, priority: UILayoutPriority = .required) -> (top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint) {
        let top = self.topSafe(insets.top, priority: priority)
        let left = self.leftSafe(insets.left, priority: priority)
        let bottom = self.bottomSafe(insets.bottom, priority: priority)
        let right = self.rightSafe(insets.right, priority: priority)
        return (top: top, left: left, bottom: bottom, right: right)
    }

    @discardableResult
    func fillLeadingTrailingSafe(_ inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> (top: NSLayoutConstraint, leading: NSLayoutConstraint, bottom: NSLayoutConstraint, trailing: NSLayoutConstraint) {
        let top = self.topSafe(inset, priority: priority)
        let leading = self.leadingSafe(inset, priority: priority)
        let bottom = self.bottomSafe(inset, priority: priority)
        let trailing = self.trailingSafe(inset, priority: priority)
        return (top: top, leading: leading, bottom: bottom, trailing: trailing)
    }

    @discardableResult
    func fillLeadingTrailingSafe(_ insets: UIEdgeInsets, priority: UILayoutPriority = .required) -> (top: NSLayoutConstraint, leading: NSLayoutConstraint, bottom: NSLayoutConstraint, trailing: NSLayoutConstraint) {
        let top = self.topSafe(insets.top, priority: priority)
        let leading = self.leadingSafe(insets.left, priority: priority)
        let bottom = self.bottomSafe(insets.bottom, priority: priority)
        let trailing = self.trailingSafe(insets.right, priority: priority)
        return (top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
    // MARK: - Edge to another view's edge

    @discardableResult
    func leading(after view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailing(before view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func left(after view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(equalTo: view.rightAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func top(after view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func right(before view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(equalTo: view.leftAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func bottom(before view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Edge less than another view's edge

    @discardableResult
    func leadingLess(after view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailingLess(before view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func leftLess(after view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func topLess(after view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func rightLess(before view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(lessThanOrEqualTo: view.leftAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottomLess(before view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Edge greater than another view's edge

    @discardableResult
    func leadingGreater(after view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailingGreater(before view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func leftGreater(after view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(greaterThanOrEqualTo: view.rightAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func topGreater(after view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func rightGreater(before view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottomGreater(before view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Edge to anchor

    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leadingAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.trailingAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func left(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func right(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Edge less than anchor

    @discardableResult
    func leadingLess(than anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailingLess(than anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func leftLess(than anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func topLess(than anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func rightLess(than anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottomLess(than anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Edge greater than anchor

    @discardableResult
    func leadingGreater(than anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailingGreater(than anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func leftGreater(than anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.leftAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func topGreater(than anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func rightGreater(than anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.rightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottomGreater(than anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Constraints equal to view controller

    @discardableResult
    @available(iOS, deprecated: 11.0)
    func leadingSafe(to viewController: UIViewController, inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.leadingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.leadingAnchor, constant: inset)
        } else {
            constraint = self.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: inset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    @available(iOS, deprecated: 11.0)
    func trailingSafe(to viewController: UIViewController, inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.trailingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.trailingAnchor, constant: inset)
        } else {
            constraint = self.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: inset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    @available(iOS, deprecated: 11.0)
    func leftSafe(to viewController: UIViewController, inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.leftAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.leftAnchor, constant: inset)
        } else {
            constraint = self.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: inset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    @available(iOS, deprecated: 11.0)
    func topSafe(to viewController: UIViewController, inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.topAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor, constant: inset)
        } else {
            constraint = self.topAnchor.constraint(equalTo: viewController.topLayoutGuide.bottomAnchor, constant: inset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    @available(iOS, deprecated: 11.0)
    func rightSafe(to viewController: UIViewController, inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.rightAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.rightAnchor, constant: -inset)
        } else {
            constraint = self.rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: -inset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    @available(iOS, deprecated: 11.0)
    func bottomSafe(to viewController: UIViewController, inset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        if #available(iOS 11.0, *) {
            constraint = self.bottomAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.bottomAnchor, constant: -inset)
        } else {
            constraint = self.bottomAnchor.constraint(equalTo: viewController.bottomLayoutGuide.topAnchor, constant: -inset)
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Center to parent
    
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
    func center(_ offset: CGPoint = CGPoint.zero, priority: UILayoutPriority = .required) -> (centerX: NSLayoutConstraint, centerY: NSLayoutConstraint) {
        let centerX = self.centerX(offset.x, priority: priority)
        let centerY = self.centerY(offset.y, priority: priority)
        return (centerX: centerX, centerY: centerY)
    }

    // MARK: - Center less than parent's center

    @discardableResult
    func centerXLess(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(lessThanOrEqualTo: self.superview!.centerXAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerYLess(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(lessThanOrEqualTo: self.superview!.centerYAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Center greater than parent's center

    @discardableResult
    func centerXGreater(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(greaterThanOrEqualTo: self.superview!.centerXAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerYGreater(_ offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(greaterThanOrEqualTo: self.superview!.centerYAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Center to another view's center

    @discardableResult
    func centerX(to view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerY(to view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func center(to view: UIView, offset: CGPoint = CGPoint.zero, priority: UILayoutPriority = .required) -> (centerX: NSLayoutConstraint, centerY: NSLayoutConstraint) {
        let centerX = self.centerX(to: view, offset: offset.x, priority: priority)
        let centerY = self.centerY(to: view, offset: offset.y, priority: priority)
        return (centerX: centerX, centerY: centerY)
    }

    // MARK: - Center less than another view's center

    @discardableResult
    func centerXLess(than view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerYLess(than view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(lessThanOrEqualTo: view.centerYAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Center less than another view's center

    @discardableResult
    func centerXGreater(than view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerYGreater(than view: UIView, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(greaterThanOrEqualTo: view.centerYAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Center to anchor
    
    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(equalTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Center less than anchor

    @discardableResult
    func centerXLess(than anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerYLess(than anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    // MARK: - Center greater than anchor

    @discardableResult
    func centerXGreater(than anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerXAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerYGreater(than anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
}
