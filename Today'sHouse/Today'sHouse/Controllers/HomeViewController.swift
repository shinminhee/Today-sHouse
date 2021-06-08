//
//  ViewController.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/01.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let searchBar = UIView()
    let searchTextField = UITextField()
    let searchImage = UIImageView()
    let searchBackImage = UIImageView()
    let markBackbarbutton = UIBarButtonItem(image: (UIImage(systemName: "bookmark")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)), style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleBarButton(_:)))
    let cartBackbarbutton = UIBarButtonItem(image: (UIImage(systemName: "cart")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)), style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleBarButton(_:)))
    
    lazy var pageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: pageCollectionViewLayout)
    var pageCollectionViewLayout = UICollectionViewFlowLayout()
    var customMenuBar = CustomMenuBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        view.backgroundColor = .white
        navigationController?.hidesBarsOnSwipe = true
    
    }
}

extension HomeViewController: CustomMenuBarDelegate {
    func customMenuBar(scrollTo index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        self.pageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pageCollectionView.dequeueReusableCell(withReuseIdentifier: PageCell.identifier, for: indexPath) as! PageCell
        cell.label.text = "\(indexPath.row + 1)번째 뷰"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CustomMenuBar.homeTabBarText.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        customMenuBar.indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / CGFloat(CustomMenuBar.homeTabBarText.count)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
        let indexPath = IndexPath(item: itemAt, section: 0)
        customMenuBar.customTabBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeViewController {
    @objc
    func handleBarButton(_ sender: UIBarButtonItem) {
        navigationController?.pushViewController(CartViewController(), animated: true)
    }
}

extension HomeViewController {
    final private func setUI() {
        setLayout()
        setBasic()
        setNavigation()
    }
    final private func setLayout() {
        view.addSubview(searchBar)
        [searchImage, searchBackImage, searchTextField].forEach {
            searchBar.addSubview($0)
        }
        searchBar.snp.makeConstraints {
            $0.width.equalTo(250)
            $0.height.equalTo(40)
        }
        searchImage.snp.makeConstraints {
            $0.leading.top.bottom.equalTo(searchBar).inset(5)
            $0.width.equalTo(30)
        }
        searchBackImage.snp.makeConstraints {
            $0.trailing.top.bottom.equalTo(searchBar).inset(5)
            $0.width.equalTo(35)
        }
        searchTextField.snp.makeConstraints {
            $0.leading.equalTo(searchImage.snp.trailing).offset(5)
            $0.trailing.equalTo(searchBackImage.snp.leading)
            $0.height.equalTo(searchBar)
        }
        view.addSubview(customMenuBar)
        customMenuBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(60)
        }
        view.addSubview(pageCollectionView)
        pageCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom)
            $0.top.equalTo(customMenuBar.snp.bottom)
        }
    }
    final private func setBasic() {
        
        customMenuBar.delegate = self
        pageCollectionViewLayout.scrollDirection = .horizontal
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        pageCollectionView.backgroundColor = .gray
        pageCollectionView.showsHorizontalScrollIndicator = false
        pageCollectionView.isPagingEnabled = true
        pageCollectionView.register(PageCell.self, forCellWithReuseIdentifier: PageCell.identifier)
        
    }
    final private func setNavigation() {
        searchBar.contentMode = .scaleAspectFit
        searchBar.backgroundColor = UIColor.appColor(.lightGray)
        searchBar.layer.cornerRadius = 5
        
        searchTextField.placeholder = "오늘의집 통합검색"
        
        searchImage.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        searchBackImage.image = UIImage(systemName: "camera.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        
        let leftCustomButton = UIBarButtonItem(customView: searchBar)
        var leftBarButtons: [UIBarButtonItem] = []
        // Array에 버튼 아이템을 추가
        leftBarButtons.append(leftCustomButton)
        // LeftBarButtonItems 배열을 셋업
        navigationItem.leftBarButtonItems = leftBarButtons
        navigationItem.rightBarButtonItems = [cartBackbarbutton, markBackbarbutton]
    }
}

//// RightBarButtons에 추가할 UIBarButtonItem을 생성
//let customButton = UIBarButtonItem(customView: customView)
//// Container가 될 Array를 생성 (혹은 직접 지정하는 방법도 있습니다)
//let rightBarButtons: [UIBarButtonItem] = []
//// Array에 버튼 아이템을 추가
//rightBarButtons.append(customButton)
//// RightBarButtonItems 배열을 셋업
//viewController.navigationItem.rightBarButtonItems = rightBarButtons
////LeftBarButtons에 추가할 UIBarButtonItem을 생성
//let customButtonCopy = UIBarButtonItem(customView: customView)
//// Container가 될 Array를 생성 (혹은 직접 지정하는 방법도 있습니다)
//let leftBarButtons: [UIBarButtonItem] = []
//// Array에 버튼 아이템을 추가
//leftBarButtons.append(customButtonCopy)
//// LeftBarButtonItems 배열을 셋업
//viewController.navigationItem.leftBarButtonItems = leftBarButtons

//tton = UIBarButtonItem(customView: markBackbarbutton)
//let rightSecondCustomButton = UIBarButtonItem(customView: markBackbarbutton)
//// Container가 될 Array를 생성 (혹은 직접 지정하는 방법도 있습니다)
//var rightBarButtons: [UIBarButtonItem] = []
//var rightSecondBarButtons: [UIBarButtonItem] = []
//
//// Array에 버튼 아이템을 추가
//rightBarButtons.append(rightCustomButton)
//rightSecondBarButtons.append(rightSecondCustomButton)
//// RightBarButtonItems 배열을 셋업
//navigationItem.rightBa
