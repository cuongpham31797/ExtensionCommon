//
//  UIViewController+Extension.swift
//  ExtensionCommon
//
//  Created by Cuong Pham on 16/4/24.
//

import Foundation
import UIKit

public extension UIViewController {
    class func loadFromNib<T: UIViewController>(type: T.Type) -> T {
        return T(nibName: T.className, bundle: nil)
    }
}
