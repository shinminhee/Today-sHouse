//
//  CustomMenuBar.swift
//  TodayHouse
//
//  Created by JEON JUNHA on 2021/06/01.
//

import SnapKit
import UIKit

protocol CustomMenuBarDelegate: AnyObject {
    func customMenuBar(scrollTo index: Int)
}

class CustomMenuBar: UIView {
  
    let customCollectionViewLayout = UICollectionViewFlowLayout()
    lazy var customTabBarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: customCollectionViewLayout)
    var indicatorView = UIView()
    weak var delegate: CustomMenuBarDelegate?
    static let homeTabBarText = ["인기", "사진", "집들이", "노하우", "전문가집들이", "질문과답"]
    //MARK: Properties
    var indicatorViewLeadingConstraint:NSLayoutConstraint!
    var indicatorViewWidthConstraint: NSLayoutConstraint!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK:- UICollectionViewDelegate, DataSource
extension CustomMenuBar: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = customTabBarCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        cell.label.text = CustomMenuBar.homeTabBarText[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CustomMenuBar.homeTabBarText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 6 , height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.customMenuBar(scrollTo: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCell else {return}
        cell.label.textColor = .lightGray
    }
}
//MARK:- UICollectionViewDelegateFlowLayout
extension CustomMenuBar: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}


extension CustomMenuBar {
    func setUI() {
        setupCustomTabBar()
        setCollectionView()
    }
    func setCollectionView() {
        
        customCollectionViewLayout.scrollDirection = .horizontal
        customCollectionViewLayout.minimumInteritemSpacing = 10
        customCollectionViewLayout.minimumLineSpacing = 10
        customCollectionViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        customCollectionViewLayout.sectionInsetReference = .fromSafeArea
        customCollectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        indicatorView.backgroundColor = .blue
    }
    //MARK: Setup Views
    func setupCollectioView() {
        customTabBarCollectionView.delegate = self
        customTabBarCollectionView.dataSource = self
        customTabBarCollectionView.showsHorizontalScrollIndicator = false
        customTabBarCollectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        customTabBarCollectionView.backgroundColor = .white
    }
    
    func setupCustomTabBar() {
        setupCollectioView()
        self.addSubview(customTabBarCollectionView)
        customTabBarCollectionView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(55)
        }
        self.addSubview(indicatorView)
        indicatorView.snp.makeConstraints {
            $0.height.equalTo(5)
            $0.top.equalTo(customTabBarCollectionView.snp.bottom)
            $0.leading.trailing.equalTo(customTabBarCollectionView)
            $0.bottom.equalToSuperview()
        }
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorViewWidthConstraint = indicatorView.widthAnchor.constraint(equalToConstant: self.frame.width / CGFloat(CustomMenuBar.homeTabBarText.count))
        indicatorViewWidthConstraint.isActive = true
        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        indicatorViewLeadingConstraint.isActive = true
    }
    
}
