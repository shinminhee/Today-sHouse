//
//  InteriorLabel.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/04.
//

import UIKit

class InteriorLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.appColor(.lightGray).cgColor
        self.textAlignment = .center
    }
    
    init(view: UIView) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
