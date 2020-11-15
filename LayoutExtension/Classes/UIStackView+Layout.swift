//
//  UIStackView+Layout.swift
//  LayoutExtension
//
//  Created by Ariel Bogdziewicz on 26/09/2020.
//

import UIKit

public extension UIStackView {

    // MARK: - Arranged subviews

    func addArrangedSubview(_ view: UIView, completion: (_ view: UIView) -> Void) {
        self.addArrangedSubview(view)
        completion(view)
    }

    func insertArrangedSubview(_ view: UIView, at stackIndex: Int, completion: (_ view: UIView) -> Void) {
        self.insertArrangedSubview(view, at: stackIndex)
        completion(view)
    }

    func removeAllArrangedSubviews() {
        for view in self.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
}
