//
//  BaseViewModel.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import Foundation
import Combine

open class BaseViewModel {
    public var subscription: Set<AnyCancellable> = Set<AnyCancellable>()
    
    public init() { }
}
