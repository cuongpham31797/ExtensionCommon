//
//  TagItemCell.swift
//  TagCollectionView
//
//  Created by Cuong Pham on 17/4/24.
//

import UIKit

public struct TagItemEntity {
    var id: Int
    var title: String
    var isChoosen: Bool
}

public final class TagItemCell: UICollectionViewCell {
    
    @IBOutlet private weak var backgroundContentView: UIView!
    @IBOutlet private weak var titleItemLabel: UILabel!
    
    public override var isSelected: Bool {
        didSet {
            setupUI(isChoosen: isSelected)
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setupUI(isChoosen: false)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        backgroundContentView.layer.cornerRadius = 12.0
        backgroundContentView.layer.borderWidth = 1.0
        backgroundContentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setupUI(isChoosen: Bool) {
        backgroundContentView.backgroundColor =  isChoosen ? .cyan : .clear
        titleItemLabel.textColor = isChoosen ? UIColor.white : .gray
        backgroundContentView.layer.borderColor = isChoosen ? UIColor.cyan.cgColor : UIColor.lightGray.cgColor
    }
    
    func setupColor(backgroundColorSelected: UIColor,
                    backgroundColorUnselected: UIColor,
                    textColorSelected: UIColor,
                    textColorUnselected: UIColor,
                    borderColorSelected: UIColor,
                    borderColorUnselected: UIColor) {
        
    }
    
    func setupData(_ data: TagItemEntity) {
        titleItemLabel.text = data.title
    }
}
