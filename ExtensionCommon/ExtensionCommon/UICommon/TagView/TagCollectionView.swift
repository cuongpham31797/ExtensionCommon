//
//  TagCollectionView.swift
//  TagCollectionView
//
//  Created by Cuong Pham on 17/4/24.
//

import UIKit

public final class TagCollectionView: UICollectionView {
    
    public override init(frame: CGRect, 
                         collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.allowsMultipleSelection = true
        let layout: TagFlowLayout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        self.collectionViewLayout = layout
        self.register(UINib(nibName: "TagItemCell",
                            bundle: nil),
                      forCellWithReuseIdentifier: "TagItemCell")
    }
}

/** How to use
 - Step 1: declare data array
 var dataArray: [TagItemEntity] = [
     TagItemEntity(id: 1, title: "Hà Nội", isChoosen: false),
     TagItemEntity(id: 2, title: "Thành phố Hồ Chí Minh -  Sài Gòn", isChoosen: false)
 ]
 - Step 2: setup tag collection view
 mainCollectionView.delegate = self
 mainCollectionView.dataSource = self
 mainCollectionView.setup()
 - Step 3: setup cell in cellForRowAt func
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "TagItemCell", for: indexPath) as? TagItemCell else {
         return UICollectionViewCell()
     }
     cell.setupColor(backgroundColorSelected: .red,
                     backgroundColorUnselected: .clear,
                     textColorSelected: .white,
                     textColorUnselected: .gray,
                     borderColorSelected: .red,
                     borderColorUnselected: .black)
     cell.setupData(dataArray[indexPath.row])
     return cell
 }

 */
