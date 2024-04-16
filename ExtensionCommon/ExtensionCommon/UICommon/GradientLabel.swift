//
//  GradientLabel.swift
//  ExtensionCommon
//
//  Created by Cuong Pham on 16/4/24.
//

import Foundation
import UIKit

public class GradientLabel: UILabel {

    var gradientColors: [CGColor] = []

    public override func drawText(in rect: CGRect) {
        if let gradientColor = drawGradientColor(in: rect, colors: gradientColors) {
            self.textColor = gradientColor
        }
        super.drawText(in: rect)
    }

    private func drawGradientColor(in rect: CGRect, colors: [CGColor]) -> UIColor? {
        let currentContext: CGContext? = UIGraphicsGetCurrentContext()
        
        currentContext?.saveGState()
        defer {
            currentContext?.restoreGState()
        }

        let size = rect.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else { return nil }

        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        context?.drawLinearGradient(gradient,
                                    start: CGPoint(x: 0, y: size.height * 0.2),
                                    end: CGPoint(x: 0, y: size.height * 0.9),
                                    options: [])
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = gradientImage else { return nil }
        return UIColor(patternImage: image)
    }

}
