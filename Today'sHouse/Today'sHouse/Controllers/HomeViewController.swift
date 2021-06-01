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
    let homeTableView = UITableView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        view.backgroundColor = .blue
        navigationController?.hidesBarsOnSwipe = true
        
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { fatalError() }
        return cell
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
        setTableView()
    }
    final private func setLayout() {
        view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
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
        
    }
    final private func setBasic() {
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
    
    final private func setTableView() {
        homeTableView.dataSource = self
        homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        
        

        
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
