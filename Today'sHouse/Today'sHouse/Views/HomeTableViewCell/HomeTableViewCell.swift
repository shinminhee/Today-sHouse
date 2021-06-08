//
//  HomeTableViewCell.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/01.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
     static let identifier = "HomeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeTableViewCell {
    final private func setUI() {
        setBasic()
        setLayout()
    }
    final private func setBasic() {
        
    }
    final private func setLayout() {
        
    }
    
}
