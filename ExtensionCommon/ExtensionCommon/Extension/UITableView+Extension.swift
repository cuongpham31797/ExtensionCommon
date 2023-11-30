//
//  UITableView+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import Foundation
import UIKit

public extension UITableView {
    func registerCell<T: UITableViewCell>(_ tableViewCellType: T.Type) {
        let nibCell: UINib = UINib(nibName: tableViewCellType.className, bundle: nil)
        self.register(nibCell, forCellReuseIdentifier: String(describing: tableViewCellType))
    }
    
    func dequeueCell<T: UITableViewCell>(cellForRowAt indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            return UITableViewCell() as! T
        }
        return cell
    }
}
