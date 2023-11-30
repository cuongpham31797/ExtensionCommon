//
//  JSONDecoder+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import UIKit

public extension JSONDecoder {
    func decodeJson<T: Decodable>(type: T.Type, json: String) throws -> T {
        let data: Data = json.data(using: String.Encoding.utf8) ?? Data()
        let result: T = try self.decode(type, from: data)
        return result
    }
}
