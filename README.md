# UIKit LayoutExtension  

[![Build Status](https://travis-ci.org/abswift/layout-extension.svg?branch=master)](https://travis-ci.org/abswift/layout-extension)
[![Version](https://img.shields.io/cocoapods/v/LayoutExtension.svg?style=flat)](https://cocoapods.org/pods/LayoutExtension)
[![License](https://img.shields.io/cocoapods/l/LayoutExtension.svg?style=flat)](https://cocoapods.org/pods/LayoutExtension)
[![Platform](https://img.shields.io/cocoapods/p/LayoutExtension.svg?style=flat)](https://cocoapods.org/pods/LayoutExtension)

LayoutExtension is DSL (domain-specific language) for UIKit's auto layout on iOS. It's based on behavior driven design making the most used syntax the most simple.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Required deployment target is iOS >= 9.0

## Installation

### CocoaPods

To install LayoutExtension through [CocoaPods](https://cocoapods.org), simply add the following line to your `Podfile`:

```ruby
pod 'LayoutExtension'
```

### Carthage

To install LayoutExtension through [Carthage](https://github.com/Carthage/Carthage), simply specify it in your `Cartfile`:

```ogdl
github "abswift/LayoutExtension"
```

### Swift Package Manager

To install LayoutExtension through [Swift Package Manager](https://swift.org/package-manager/), add it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(name: "LayoutExtension", url: "git@github.com:abswift/layout-extension.git", .upToNextMajor(from: "1.0.0"))
]
```

Or via the `File > Swift Packages > Add Package Dependency…` menu item in Xcode.

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can install LayoutExtension into your project manually by downloading or cloning the files into your project.

## Usage

Basic example:

```swift
self.view.addSubview(box) { subview in
    subview.width(50)
    subview.height(50)
    subview.center()
}
```

When using the library through a dependency manager make sure to import the library like so:

```swift
import LayoutExtension
```

## Syntax

### Extension for adding subviews

Constraints can be created only when subview is added to its parent's view. So LayoutExtension predicts that constraints are always created just after adding subview to parent's view according to behavior driven design.

So there are specified following extensions to exising functions like these below

```swift
view.addSubview(button1) { subview in
    subview.topSafe(40.0)
    subview.centerX()
    subview.height(50.0)
}

view.insertSubview(button2, at: 0) { subview in
    subview.top(after: button1, offset: 30.0)
    subview.centerX()
    subview.height(50.0)
}

view.insertSubview(button3, belowSubview: button1) { subview in
    subview.top(after: button1, offset: 30.0)
    subview.left(40.0)
    subview.right(40.0)
    subview.height(50.0)
}

view.insertSubview(button4, aboveSubview: button1) { subview in
    subview.top(after: button1, offset: 30.0)
    subview.centerX()
    subview.height(50.0)
}
```

### Full list of view's extensions

All the methods return `NSLayoutConstraint` object. Syntax is following:

* All methods return activated `NSLayoutConstraint` or tuple of constraints
* All methods are `@discardableResult`
* Default value for `constant` is always `0.0`
* Default value for `multiplier` is always `1.0`
* Default value for `priority` is always `.required` and this is always last parameter

#### Size to constant

```
UIView.width(_ width: priority:)
UIView.widthLess(_ width: priority:)
UIView.widthGreater(_ width: priority:)
UIView.height(_ height: priority:)
UIView.heightLess(_ height: priority:)
UIView.heightGreater(_ height: priority:)
```

#### Size to dimension

```
UIView.width(to <anchor>: multiplier: constant: priority:)
UIView.widthLess(than <anchor>: multiplier: constant: priority:)
UIView.widthGreater(than <anchor>: multiplier: constant: priority:)
UIView.height(to <anchor>: multiplier: constant: priority:)
UIView.heightLess(than <anchor>: multiplier: constant: priority:)
UIView.heightGreater(than <anchor>: multiplier: constant: priority:)
```

#### Edge to parent

```
UIView.leading(_ inset: priority:)
UIView.leadingLess(_ inset: priority:)
UIView.leadingGreater(_ inset: priority:)
UIView.trailing(_ inset: priority:)
UIView.trailingLess(_ inset: priority:)
UIView.trailingGreater(_ inset: priority:)
UIView.left(_ inset: priority:)
UIView.leftLess(_ inset: priority:)
UIView.leftGreater(_ inset: priority:)
UIView.right(_ inset: priority:)
UIView.rightLess(_ inset: priority:)
UIView.rightGreater(_ inset: priority:)
UIView.top(_ inset: priority:)
UIView.topLess(_ inset: priority:)
UIView.topGreater(_ inset: priority:)
UIView.bottom(_ inset: priority:)
UIView.bottomLess(_ inset: priority:)
UIView.bottomGreater(_ inset: priority:)
```

#### Fill to parent

```
UIView.fill(_ inset: priority:)
UIView.fill(_ insets: priority:)
UIView.fillLeadingTrailing(_ inset: priority:)
UIView.fillLeadingTrailing(_ insets: priority:)
```

#### Edge to parent's safe area

```
UIView.leadingSafe(_ inset: priority:)
UIView.trailingSafe(_ inset: priority:)
UIView.leftSafe(_ inset: priority:)
UIView.rightSafe(_ inset: priority:)
UIView.topSafe(_ inset: priority:)
UIView.bottomSafe(_ inset: priority:)
```

#### Fill to parent's safe area

```
UIView.fillSafe(_ inset: priority:)
UIView.fillSafe(_ insets: priority:)
UIView.fillLeadingTrailingSafe(_ inset: priority:)
UIView.fillLeadingTrailingSafe(_ insets: priority:)
```

#### Edge to another view's edge

This is useful very often and quite tricky.

```
UIView.leading(after <view>: offset: priority:)
UIView.leadingLess(after <view>: offset: priority:)
UIView.leadingGreater(after <view>: offset: priority:)
UIView.trailing(before <view>: offset: priority:)
UIView.trailingLess(before <view>: offset: priority:)
UIView.trailingGreater(before <view>: offset: priority:)
UIView.left(after <view>: offset: priority:)
UIView.leftLess(after <view>: offset: priority:)
UIView.leftGreater(after <view>: offset: priority:)
UIView.right(before <view>: offset: priority:)
UIView.rightLess(before <view>: offset: priority:)
UIView.rightGreater(before <view>: offset: priority:)
UIView.top(after <view>: offset: priority:)
UIView.topLess(after <view>: offset: priority:)
UIView.topGreater(after <view>: offset: priority:)
UIView.bottom(before <view>: offset: priority:)
UIView.bottomLess(before <view>: offset: priority:)
UIView.bottomGreater(before <view>: offset: priority:)
```

#### Edge to anchor

```
UIView.leading(to <anchor>: offset: priority:)
UIView.leadingLess(than <anchor>: offset: priority:)
UIView.leadingGreater(than <anchor>: offset: priority:)
UIView.trailing(to <anchor>: offset: priority:)
UIView.trailingLess(than <anchor>: offset: priority:)
UIView.trailingGreater(than <anchor>: offset: priority:)
UIView.left(to <anchor>: offset: priority:)
UIView.leftLess(than <anchor>: offset: priority:)
UIView.leftGreater(than <anchor>: offset: priority:)
UIView.right(to <anchor>: offset: priority:)
UIView.rightLess(than <anchor>: offset: priority:)
UIView.rightGreater(than <anchor>: offset: priority:)
UIView.top(to <anchor>: offset: priority:)
UIView.topLess(than <anchor>: offset: priority:)
UIView.topGreater(than <anchor>: offset: priority:)
UIView.bottom(to <anchor>: offset: priority:)
UIView.bottomLess(than <anchor>: offset: priority:)
UIView.bottomGreater(than <anchor>: offset: priority:)
```

#### Edge to view controller's safe area (layout guide)

All these in this section are `@available(iOS, deprecated: 11.0)`.

```
UIView.leadingSafe(to <view controller>: offset: priority:)
UIView.trailingSafe(to <view controller>: offset: priority:)
UIView.leftSafe(to <view controller>: offset: priority:)
UIView.rightSafe(to <view controller>: offset: priority:)
UIView.topSafe(to <view controller>: offset: priority:)
UIView.bottomSafe(to <view controller>: offset: priority:)
```

#### Center to parent

```
UIView.centerX(_ offset: priority:)
UIView.centerXLess(_ offset: priority:)
UIView.centerXGreater(_ offset: priority:)
UIView.centerY(_ offset: priority:)
UIView.centerYLess(_ offset: priority:)
UIView.centerYGreater(_ offset: priority:)
UIView.center(_ offset <point>: priority:)
```

#### Center to another view's center

```
UIView.centerX(to <view>: offset: priority:)
UIView.centerXLess(than <view>: offset: priority:)
UIView.centerXGreater(than <view>: offset: priority:)
UIView.centerY(to <view>: offset: priority:)
UIView.centerYLess(than <view>: offset: priority:)
UIView.centerYGreater(than <view>: offset: priority:)
```

#### Center to anchor

```
UIView.centerX(to <anchor>: offset: priority:)
UIView.centerXLess(than <anchor>: offset: priority:)
UIView.centerXGreater(than <anchor>: offset: priority:)
UIView.centerY(to <anchor>: offset: priority:)
UIView.centerYLess(than <anchor>: offset: priority:)
UIView.centerYGreater(than <anchor>: offset: priority:)
```

## Author

Ariel Bogdziewicz @ AB Software

## License

LayoutExtension is available under the MIT license. See the LICENSE file for more info.
