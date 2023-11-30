//
//  UICollectionView+Extension.swift
//  SwiftCommon
//
//  Created by Cuong Pham on 29/11/2023.
//

import Foundation
import UIKit

public extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_ collectionViewCellType: T.Type) {
        let nibCell: UINib = UINib(nibName: collectionViewCellType.className, bundle: nil)
        self.register(nibCell, forCellWithReuseIdentifier: String(describing: collectionViewCellType))
    }
    
    func dequeueCell<T: UICollectionViewCell>(cellForRowAt indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self),
                                         for: indexPath) as? T else {
            return UICollectionViewCell() as! T
        }
        return cell
    }
    
    func registerHeaderFooter<T: UICollectionReusableView>(_ collectionViewViewType: T.Type, kind: String) {
        let nibName: String = String(describing: collectionViewViewType)
        self.register(UINib(nibName: nibName, bundle: nil),
                      forSupplementaryViewOfKind: kind,
                      withReuseIdentifier: nibName)
    }
}
