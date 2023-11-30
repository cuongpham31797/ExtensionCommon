//
//  UIStoryboard+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import Foundation
import UIKit

public extension UIStoryboard {
    func initScreen<T: UIViewController>(_ viewControllerType: T.Type) -> T {
        guard let viewController =
                instantiateViewController(withIdentifier: viewControllerType.className) as? T else {
            fatalError("Could not instantiateViewController with identifier: \(viewControllerType)")
        }
        return viewController
    }
    
    class func name(_ name: String, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: bundle)
    }
}
