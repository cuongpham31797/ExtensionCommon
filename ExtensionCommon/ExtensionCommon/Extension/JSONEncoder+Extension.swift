//
//  JSONEncoder+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import UIKit

public extension JSONEncoder {
    func encodeDto<T: Encodable>(dto: T) throws -> String {
        let data: Data = try self.encode(dto)
        let jsonString: String = String(data: data, encoding: String.Encoding.utf8) ?? String.empty
        return jsonString
    }
}
