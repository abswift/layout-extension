//
//  ViewController.swift
//  LayoutExtension
//
//  Created by Ariel Bogdziewicz on 05/30/2019.
//  Copyright (c) 2019 Ariel Bogdziewicz. All rights reserved.
//

import UIKit
import LayoutExtension

class ViewController: UIViewController {

    // MARK: - Subviews

    private var buttons: [Alignment: Button] = [:]
    private let playAreaView = UIView().autoLayout
    private let ballView = UIView().autoLayout

    private var ballViewLeftDefault: NSLayoutConstraint!
    private var ballViewTopDefault: NSLayoutConstraint!

    private var ballViewWidthDefault: NSLayoutConstraint!
    private var ballViewHeightDefault: NSLayoutConstraint!

    private var ballViewLeft: NSLayoutConstraint!
    private var ballViewCenterX: NSLayoutConstraint!
    private var ballViewRight: NSLayoutConstraint!
    private var ballViewTop: NSLayoutConstraint!
    private var ballViewCenterY: NSLayoutConstraint!
    private var ballViewBottom: NSLayoutConstraint!

    // MARK: - Properties

    private var alignment: Alignment = .none {
        didSet {
            self.updateAlignment(animated: true)
        }
    }

    // MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // Vertical stack view for buttons
        let verticalStackView = UIStackView().autoLayout
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 1.0
        self.view.addSubview(verticalStackView) { subview in
            subview.topSafe(20.0)
            subview.leftSafe(20.0)
            subview.rightSafe(20.0)
        }

        // Create horizontal stack views with buttons
        let buttonIdentifiers: [[Alignment]] = [
            [.left, .top],
            [.centerX, .centerY],
            [.bottom, .right]
        ]
        for row in buttonIdentifiers {
            // Horizontal stack view
            let horizontalStackView = UIStackView().autoLayout
            horizontalStackView.axis = .horizontal
            horizontalStackView.spacing = 1.0
            horizontalStackView.distribution = .fillEqually
            verticalStackView.addArrangedSubview(horizontalStackView) { subview in
                subview.height(50.0)
            }

            // Create buttons
            for alignment in row {
                // Button
                let button = Button(type: .custom)
                button.regularBackgroundColor = .green
                button.regularTitleColor = .black
                button.selectedBackgroundColor = .red
                button.selectedTitleColor = .white
                button.tag = alignment.rawValue
                button.title = alignment.title
                button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
                horizontalStackView.addArrangedSubview(button)
            }
        }

        // Create play area
        self.playAreaView.backgroundColor = .lightGray
        self.view.addSubview(self.playAreaView) { subview in
            subview.top(after: verticalStackView, offset: 20.0)
            subview.leftSafe(20.0)
            subview.rightSafe(20.0)
            subview.bottomSafe(20.0)
        }

        // Label
        self.ballView.backgroundColor = .black
        playAreaView.addSubview(self.ballView) { subview in
            // Firstly we create deactivated positions controlled by buttons
            self.ballViewLeft = subview.left().deactivate()
            self.ballViewCenterX = subview.centerX().deactivate()
            self.ballViewRight = subview.right().deactivate()
            self.ballViewTop = subview.top().deactivate()
            self.ballViewCenterY = subview.centerY().deactivate()
            self.ballViewBottom = subview.bottom().deactivate()

            // Default position
            self.ballViewWidthDefault = subview.width(100.0)
            self.ballViewHeightDefault = subview.height(100.0)
            self.ballViewLeftDefault = subview.left(50.0)
            self.ballViewTopDefault = subview.top(50.0)
        }
    }

    // MARK: - ViewController methods

    private func updateAlignment(animated: Bool) {
        let left = self.alignment.contains(.left)
        let centerX = self.alignment.contains(.centerX)
        let right = self.alignment.contains(.right)
        let top = self.alignment.contains(.top)
        let centerY = self.alignment.contains(.centerY)
        let bottom = self.alignment.contains(.bottom)

        self.ballViewWidthDefault.isActive = false
        self.ballViewHeightDefault.isActive = false
        self.ballViewLeftDefault.isActive = false
        self.ballViewTopDefault.isActive = false

        self.ballViewLeft.isActive = left
        self.ballViewCenterX.isActive = centerX
        self.ballViewRight.isActive = right
        self.ballViewTop.isActive = top
        self.ballViewCenterY.isActive = centerY
        self.ballViewBottom.isActive = bottom

        self.ballViewWidthDefault.isActive = !self.alignment.containsAtLeastTwo(from: [.left, .centerX, .right])
        self.ballViewHeightDefault.isActive = !self.alignment.containsAtLeastTwo(from: [.top, .centerY, .bottom])
        self.ballViewLeftDefault.isActive = !left && !centerX && !right
        self.ballViewTopDefault.isActive = !top && !centerY && !bottom

        if animated {
            UIView.animate(withDuration: 0.3) {
                self.playAreaView.layoutIfNeeded()
            }
        }
    }

    // MARK: - Actions

    @objc func buttonClicked(_ button: UIButton) {
        let alignment = Alignment(rawValue: button.tag)
        if button.isSelected {
            self.alignment.remove(alignment)
            button.isSelected = false
        } else {
            self.alignment.insert(alignment)
            button.isSelected = true
        }
    }
}
