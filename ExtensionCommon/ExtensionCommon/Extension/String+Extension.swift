//
//  String+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import Foundation
import UIKit

public extension String {
    static let empty: String = ""
    static let space: String = " "
    static let zero: String = "0"
    
    // convert "Hà Nội" to "Ha Noi"
    func convertToEnglishName() -> String {
        return self.folding(options: .diacriticInsensitive, locale: .init(identifier: "en"))
    }
    
    func removeSpace() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
}
