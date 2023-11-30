//
//  NSObject+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import Foundation

public extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
