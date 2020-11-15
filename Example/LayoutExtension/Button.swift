//
//  Button.swift
//  LayoutExtension_Example
//
//  Created by Ariel Bogdziewicz on 14/11/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class Button: UIButton {

    // MARK: - Shape

    var considerInternalInsets = false {
        didSet {
            self.setNeedsLayout()
        }
    }

    override var intrinsicContentSize: CGSize {
        if self.considerInternalInsets {
            return CGSize(
                width: super.intrinsicContentSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right + self.imageEdgeInsets.left + self.imageEdgeInsets.right,
                height: super.intrinsicContentSize.height)
        } else {
            return super.intrinsicContentSize
        }
    }

    var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.updateCornerRadius()
        }
    }

    var rounded: Bool = false {
        didSet {
            self.setNeedsLayout()
        }
    }

    // MARK: - Border

    var borderWidth: CGFloat = 0.0 {
        didSet {
            self.updateBorderWidth()
        }
    }

    var regularBorderColor: UIColor? {
        didSet {
            self.updateRegularBorderColor()
        }
    }

    var highlightedBorderColor: UIColor? {
        didSet {
            self.updateHighlightedBorderColor()
        }
    }

    var selectedBorderColor: UIColor? {
        didSet {
            self.updateSelectedBorderColor()
        }
    }

    var selectedHighlightedBorderColor: UIColor? {
        didSet {
            self.updateSelectedHighlightedBorderColor()
        }
    }

    var disabledBorderColor: UIColor? {
        didSet {
            self.updateDisabledBorderColor()
        }
    }

    // MARK: - Background

    var regularBackgroundColor: UIColor? {
        didSet {
            self.updateRegularBackgroundColor()
        }
    }

    var highlightedBackgroundColor: UIColor? {
        didSet {
            self.updateHighlightedBackgroundColor()
        }
    }

    var selectedBackgroundColor: UIColor? {
        didSet {
            self.updateSelectedBackgroundColor()
        }
    }

    var selectedHighlightedBackgroundColor: UIColor? {
        didSet {
            self.updateSelectedHighlightedBackgroundColor()
        }
    }

    var disabledBackgroundColor: UIColor? {
        didSet {
            self.updateDisabledBackgroundColor()
        }
    }

    // MARK: - Title

    @objc var title: String? {
        didSet {
            self.updateTitle()
        }
    }

    @objc var image: UIImage? {
        didSet {
            self.updateImage()
        }
    }

    var regularTitleColor: UIColor? {
        didSet {
            self.updateRegularTitleColor()
            self.updateTintColor()
        }
    }

    var highlightedTitleColor: UIColor? {
        didSet {
            self.updateHighlightedTitleColor()
            self.updateTintColor()
        }
    }

    var selectedTitleColor: UIColor? {
        didSet {
            self.updateSelectedTitleColor()
            self.updateTintColor()
        }
    }

    var selectedHighlightedTitleColor: UIColor? {
        didSet {
            self.updateSelectedHighlightedTitleColor()
            self.updateTintColor()
        }
    }

    var disabledTitleColor: UIColor? {
        didSet {
            self.updateDisabledTitleColor()
            self.updateTintColor()
        }
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.internalInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.internalInit()
    }

    fileprivate func internalInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = true
        self.updateTintColor()
    }

    // MARK: - UIView methods

    override var tintColor: UIColor! {
        set {
            self.imageView?.tintColor = newValue
            super.tintColor = newValue
            self.imageView?.tintColor = newValue
        }
        get {
            return super.tintColor
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if self.rounded {
            self.cornerRadius = self.frame.size.height/2.0
        } else {
            self.updateCornerRadius()
        }
    }

    // MARK: - Listeners

    override var isEnabled: Bool {
        didSet {
            self.updateBorder()
            self.updateTintColor()
        }
    }

    override var isHighlighted: Bool {
        didSet {
            self.updateBorder()
            self.updateTintColor()
        }
    }

    override var isHidden: Bool {
        didSet {
            self.updateBorder()
            self.updateTintColor()
        }
    }

    override var isSelected: Bool {
        didSet {
            self.updateBorder()
            self.updateTintColor()
        }
    }

    // MARK: - Update methods

    func updateCornerRadius() {
        self.layer.cornerRadius = self.cornerRadius
    }

    func updateBorder() {
        self.updateRegularBorderColor()
        self.updateHighlightedBorderColor()
        self.updateSelectedBorderColor()
        self.updateSelectedHighlightedBorderColor()
        self.updateDisabledBorderColor()
    }

    func updateTintColor() {
        if self.isEnabled {
            if self.isHighlighted && self.isSelected {
                self.tintColor = self.selectedHighlightedTitleColor
            } else if self.isHighlighted {
                self.tintColor = self.highlightedTitleColor
            } else if self.isSelected {
                self.tintColor = self.selectedTitleColor
            } else {
                self.tintColor = self.regularTitleColor
            }
        } else {
            self.tintColor = self.disabledTitleColor
        }
    }

    func updateBorderWidth() {
        self.layer.borderWidth = self.borderWidth
    }

    func updateRegularBorderColor() {
        if self.isEnabled && !self.isSelected && !self.isSelected {
            self.layer.borderColor = self.regularBorderColor?.cgColor
        }
    }

    func updateHighlightedBorderColor() {
        if self.isHighlighted {
            self.layer.borderColor = self.highlightedBorderColor?.cgColor ?? self.regularBorderColor?.cgColor
        }
    }

    func updateSelectedBorderColor() {
        if self.isSelected && !self.isHighlighted {
            self.layer.borderColor = self.selectedBorderColor?.cgColor ?? self.regularBorderColor?.cgColor
        }
    }

    func updateSelectedHighlightedBorderColor() {
        if self.isSelected && self.isHighlighted {
            self.layer.borderColor = self.selectedHighlightedBorderColor?.cgColor ?? self.selectedBorderColor?.cgColor ?? self.regularBorderColor?.cgColor
        }
    }

    func updateDisabledBorderColor() {
        if !self.isEnabled {
            self.layer.borderColor = self.disabledBorderColor?.cgColor ?? self.regularBorderColor?.cgColor
        }
    }

    func updateRegularBackgroundColor() {
        if self.regularBackgroundColor != nil {
            self.setBackgroundImage(UIImage.solid(color: self.regularBackgroundColor!), for: .normal)
        } else {
            self.setBackgroundImage(nil, for: .normal)
        }
    }

    func updateHighlightedBackgroundColor() {
        if self.highlightedBackgroundColor != nil {
            self.setBackgroundImage(UIImage.solid(color: self.highlightedBackgroundColor!), for: .highlighted)
        } else {
            self.setBackgroundImage(nil, for: .normal)
        }
    }

    func updateSelectedBackgroundColor() {
        if self.selectedBackgroundColor != nil {
            self.setBackgroundImage(UIImage.solid(color: self.selectedBackgroundColor!), for: .selected)
        } else {
            self.setBackgroundImage(nil, for: .normal)
        }
    }

    func updateSelectedHighlightedBackgroundColor() {
        if self.selectedHighlightedBackgroundColor != nil {
            self.setBackgroundImage(UIImage.solid(color: self.selectedHighlightedBackgroundColor!), for: [.selected, .highlighted])
        } else {
            self.setBackgroundImage(nil, for: .normal)
        }
    }

    func updateDisabledBackgroundColor() {
        if self.disabledBackgroundColor != nil {
            self.setBackgroundImage(UIImage.solid(color: self.disabledBackgroundColor!), for: .disabled)
        } else {
            self.setBackgroundImage(nil, for: .normal)
        }
    }

    func updateTitle() {
        self.setTitle(self.title, for: .normal)
        self.setTitle(self.title, for: .highlighted)
        self.setTitle(self.title, for: .selected)
        self.setTitle(self.title, for: .disabled)
    }

    func updateImage() {
        self.setImage(self.image, for: .normal)
        self.setImage(self.image, for: .highlighted)
        self.setImage(self.image, for: .selected)
        self.setImage(self.image, for: .disabled)
    }

    func updateRegularTitleColor() {
        self.setTitleColor(self.regularTitleColor, for: .normal)
    }

    func updateHighlightedTitleColor() {
        self.setTitleColor(self.highlightedTitleColor, for: .highlighted)
    }

    func updateSelectedTitleColor() {
        self.setTitleColor(self.selectedTitleColor, for: .selected)
    }

    func updateSelectedHighlightedTitleColor() {
        self.setTitleColor(self.selectedHighlightedTitleColor, for: [.selected, .highlighted])
    }

    func updateDisabledTitleColor() {
        self.setTitleColor(self.disabledTitleColor, for: .disabled)
    }
}
