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
}
