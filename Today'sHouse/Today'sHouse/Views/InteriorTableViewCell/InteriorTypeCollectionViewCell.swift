//
//  InteriorTypeCollectionViewCell.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/11.
//

import UIKit

class InteriorTypeCollectionViewCell: UICollectionViewCell {
    static let identifier = "InteriorTypeCollectionViewCell"
    let typeImage = UIImageView()
    let typeLable = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI() {
        setBasic()
        setLayout()
    }
    func setBasic() {
        
    }
    func setLayout() {
        [typeImage, typeLable].forEach {
            contentView.addSubview($0)
        }
        typeImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(100)
        }
        typeLable.snp.makeConstraints {
            $0.centerX.equalTo(typeImage)
            $0.top.equalTo(typeImage.snp.bottom).offset(10)
            $0.height.equalTo(20)
        }
    }
}

