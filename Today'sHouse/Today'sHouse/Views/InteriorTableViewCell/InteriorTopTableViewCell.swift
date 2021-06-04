//
//  InteriorTopTableViewCell.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/04.
//

import UIKit

class InteriorTopTableViewCell: UITableViewCell {

    let searchView = InteriorLabel()
    let requestView = InteriorLabel()
    static let identifier = "InteriorTopTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InteriorTopTableViewCell {
    final private func setUI() {
        setBasic()
        setLayout()
    }
    final private func setBasic() {
        searchView.backgroundColor = .blue
        requestView.backgroundColor = .white
        
        searchView.text = "업체 찾기"
        requestView.text = "간편상담신청"
        
      
    }
    final private func setLayout() {
        [searchView, requestView].forEach {
            contentView.addSubview($0)
        }
        searchView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(10)
            $0.trailing.equalTo(contentView.snp.centerX)
        }
        requestView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(contentView.snp.centerX)
        }
    }
    
}
