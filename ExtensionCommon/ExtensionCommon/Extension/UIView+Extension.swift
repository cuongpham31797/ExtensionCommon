//
//  UIView+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import Foundation
import UIKit

public extension UIView {
    static func safeAreaTopPadding() -> CGFloat {
        let window: UIWindow? = UIApplication.shared.windows.first(where: {
            $0.isKeyWindow
        })
        let statusBarHeight: CGFloat = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        return statusBarHeight
    }
    
    static func safeAreaBottomPadding() -> CGFloat {
        let window: UIWindow? = UIApplication.shared.windows.first(where: {
            $0.isKeyWindow
        })
        let padding: CGFloat = window?.safeAreaInsets.bottom ?? 0.0
        return padding
    }
    
    func addToKeyWindowActiveInactive() {
        UIApplication.shared.keyFirstWindowActiveInactive?.addSubview(self)
        UIApplication.shared.keyFirstWindowActiveInactive?.bringSubviewToFront(self)
    }
    
    func setGradient(colorTop: CGColor,
                     colorBottom: CGColor,
                     startPoint: CGPoint,
                     endPoint: CGPoint,
                     locations: [NSNumber] = [0.0, 0.8]) {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        layer.addSublayer(gradientLayer)
        layer.masksToBounds = true
    }
    
    func makeDashLineHorizontal(color: UIColor,
                                strokeLength: NSNumber = 6,
                                gapLength: NSNumber = 3,
                                width: CGFloat = 1) {
        let path: CGMutablePath = CGMutablePath()
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineDashPattern = [strokeLength, gapLength]
        path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.midY),
                                CGPoint(x: bounds.maxX, y: bounds.midY)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
        layer.masksToBounds = true
    }
    
    func makeDashLineVertical(color: UIColor,
                              strokeLength: NSNumber = 6,
                              gapLength: NSNumber = 3,
                              width: CGFloat = 1) {
        let path: CGMutablePath = CGMutablePath()
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineDashPattern = [strokeLength, gapLength]
        path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.midY),
                                CGPoint(x: bounds.maxX, y: bounds.midY)])
        path.addLines(between: [CGPoint(x: bounds.midX, y: bounds.minY),
                                CGPoint(x: bounds.midX, y: bounds.maxY)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
        layer.masksToBounds = true
    }
    
    func addDashLineBorder(color: UIColor,
                           radius: CGFloat = 0.0,
                           pattern: [NSNumber] = [6, 3],
                           lineWidth: CGFloat = 1.0) {
        let borderLayer: CAShapeLayer = CAShapeLayer()
        borderLayer.lineWidth = lineWidth
        borderLayer.strokeColor = color.cgColor
        borderLayer.lineDashPattern = pattern
        borderLayer.frame = bounds
        borderLayer.fillColor = nil
        borderLayer.path = UIBezierPath(roundedRect: bounds,
                                        byRoundingCorners: .allCorners,
                                        cornerRadii: CGSize(width: radius,
                                                            height: radius)).cgPath
        layer.addSublayer(borderLayer)
        layer.masksToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner,
                      radius: CGFloat) {
        let path: UIBezierPath = UIBezierPath(roundedRect: bounds,
                                              byRoundingCorners: corners,
                                              cornerRadii: CGSize(width: radius,
                                                                  height: radius))
        let mask: CAShapeLayer = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
