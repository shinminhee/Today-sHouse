//
//  PageCell.swift
//  CustomTabBar
//
//  Created by 이동건 on 2018. 4. 20..
//  Copyright © 2018년 이동건. All rights reserved.
//

import SnapKit
import UIKit

class PageCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "PageCell"
        let label = UILabel()
    let homeTableView = UITableView()

    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var isSelected: Bool {
        didSet{
            print("Changed")
            self.label.textColor = isSelected ? .black : .lightGray
        }
    }
}

extension PageCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { fatalError() }
        return cell
    }
    
}

// MARK: - UI
extension PageCell {
    final private func setUI() {
        setBasics()
        setLayout()
        setTableView()
    }
    final private func setBasics() {
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    }
    final private func setLayout() {
        self.addSubview(label)
        self.backgroundColor = .gray
        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    final private func setTableView() {
        contentView.addSubview(homeTableView)
        homeTableView.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
        homeTableView.dataSource = self
        homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)

    }
}
