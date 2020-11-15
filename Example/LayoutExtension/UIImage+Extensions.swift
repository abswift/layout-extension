//
//  UIImage+Extensions.swift
//  LayoutExtension_Example
//
//  Created by Ariel Bogdziewicz on 14/11/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

extension UIImage {

    // MARK: - Common extensions

    static func solid(color: UIColor, size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    func scaled(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return scaledImage
    }

    func scaled(height: CGFloat) -> UIImage {
        let width = round(self.size.width * height / self.size.height)
        return self.scaled(size: CGSize(width: width, height: height))
    }

    var template: UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
}
