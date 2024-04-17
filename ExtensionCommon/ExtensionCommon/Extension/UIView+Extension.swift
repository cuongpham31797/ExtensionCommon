//
//  UIView+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import Foundation
import UIKit

public enum GradientType {
    case leftToRight
    case rightToLeft
    case topToBottom
    case bottomToTop
    case topLeftToBottomRight
}

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
    
    func disableTab() {
        CATransaction.begin()
        let scale: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scale.values = [1, 0.95, 1, 1.02, 1, 0.99, 1]
        scale.timingFunction = CAMediaTimingFunction(name: .easeOut)
        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [scale]
        animationGroup.duration = 0.3
        self.layer.add(animationGroup, forKey: "pressAnimation")
        CATransaction.commit()
    }
    
    func shadow(color: CGColor? = nil,
                opacity: Float? = nil,
                offset: CGSize? = nil,
                radius: CGFloat? = 6) {
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        if let shadowColor: CGColor = color {
            self.layer.shadowColor = shadowColor
        }
        if let shadowOpacity: Float = opacity {
            self.layer.shadowOpacity = shadowOpacity
        }
        if let shadowOffset: CGSize = offset {
            self.layer.shadowOffset = shadowOffset
        }
        if let shadowRadius: CGFloat = radius {
            self.layer.shadowRadius = shadowRadius
        }
        layer.masksToBounds = false
    }
}

// MARK: - Dash Line
public extension UIView {
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
}

// MARK: - Gradient
public extension UIView {
    private func startToEnd(type: GradientType) -> (startPoint: CGPoint, endPoint: CGPoint) {
        switch type {
        case .leftToRight:
            return (CGPoint(x: 0, y: 0.5), CGPoint(x: 1, y: 0.5))
        case .rightToLeft:
            return (CGPoint(x: 1, y: 0.5), CGPoint(x: 0, y: 0.5))
        case .topToBottom:
            return (CGPoint(x: 0.5, y: 0), CGPoint(x: 0.5, y: 1))
        case .bottomToTop:
            return (CGPoint(x: 0.5, y: 1), CGPoint(x: 0.5, y: 0))
        case .topLeftToBottomRight:
            return (CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1))
        }
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
    
    func setSpecificGradient(type: GradientType,
                             colors: [CGColor],
                             in rect: CGRect? = nil,
                             cornerRadius: CGFloat = 0,
                             locations: [NSNumber] = []) {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        let point: (startPoint: CGPoint, endPoint: CGPoint) = startToEnd(type: type)
        gradientLayer.startPoint = point.startPoint
        gradientLayer.endPoint = point.endPoint
        if !locations.isEmpty {
            gradientLayer.locations = locations
        }
        if rect != nil {
            gradientLayer.frame = rect!
        } else {
            gradientLayer.frame = self.bounds
        }
        if cornerRadius != 0 {
            gradientLayer.cornerRadius = cornerRadius
        } else {
            gradientLayer.cornerRadius = self.layer.cornerRadius
        }
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
