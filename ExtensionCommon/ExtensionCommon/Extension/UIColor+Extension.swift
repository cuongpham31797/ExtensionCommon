//
//  UIColor+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import Foundation
import UIKit

public extension UIColor {
    convenience init?(hexString: String, alpha: Double? = nil) {
        let red, green, blue: CGFloat
        if hexString.hasPrefix("#") {
            let start: String.Index = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor: String = String(hexString[start...])
            if hexColor.count == 6 {
                let scanner: Scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    red = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
                    green = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
                    blue = CGFloat(hexNumber & 0x0000FF) / 255.0
                    if let alpha = alpha {
                        self.init(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
                    } else {
                        self.init(red: red, green: green, blue: blue, alpha: 1.0)
                    }
                    return
                }
            }
        }
        return nil
    }
}
