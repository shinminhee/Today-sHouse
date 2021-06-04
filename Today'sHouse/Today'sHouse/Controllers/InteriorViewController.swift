//
//  InteriorViewController.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/01.
//

import UIKit
import SnapKit

class InteriorViewController: UIViewController {
    
    let searchBar = UIView()
    let searchTextField = UITextField()
    let searchImage = UIImageView()
    let searchBackImage = UIImageView()
    let markBackbarbutton = UIBarButtonItem(image: (UIImage(systemName: "bookmark")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)), style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleBarButton(_:)))
    let cartBackbarbutton = UIBarButtonItem(image: (UIImage(systemName: "cart")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)), style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleBarButton(_:)))
    let homeTableView = UITableView(frame: .zero, style: .grouped)
    var store = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.backgroundColor = .white

        store.append(Store.init(storeName: "", detailName: ["0"]))
        store.append(Store.init(storeName: "", detailName: ["0"]))
        store.append(Store.init(storeName: "", detailName: ["0"]))
        store.append(Store.init(storeName: "", detailName: ["0"]))
        store.append(Store.init(storeName: "", detailName: ["0"]))
        
    }
}

extension InteriorViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return store.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store[section].detailName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath {
        case [0, 0]:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InteriorTopTableViewCell", for: indexPath) as? InteriorTopTableViewCell else { fatalError() }
            cell.selectionStyle = .none // 선택시 배경색상 변경 없앰
            return cell
   
        default:
            return UITableViewCell()
        }
    }
}

extension InteriorViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         return UIView()
        
    }
    //header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           switch section {
           case 0:
            return UITableView.automaticDimension
           case 1:
            return CGFloat(30)
           case 2:
            return CGFloat(5)
           default:
            return CGFloat(10)
           }
       }
    //cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case [0, 0]:
            return 70
        case [1, 0]:
            return 140
        default:
            return 200
        }
    }
}

extension InteriorViewController {
    @objc
    func handleBarButton(_ sender: UIBarButtonItem) {
        navigationController?.pushViewController(CartViewController(), animated: true)
    }
}

extension InteriorViewController {
    final private func setUI() {
        setLayout()
        setBasic()
        setTableView()
        setNavigation()
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
     
       
    }
    final private func setNavigation() {
        searchBar.contentMode = .scaleAspectFit
        searchBar.backgroundColor = UIColor.appColor(.lightGray)
        searchBar.layer.cornerRadius = 5
        
        searchTextField.placeholder = "전문가 검색"
        
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
        homeTableView.delegate = self
        homeTableView.register(InteriorTopTableViewCell.self, forCellReuseIdentifier: "InteriorTopTableViewCell")
        homeTableView.separatorInset.left = 0 // 테이블뷰 공백 없애는 법
        
        

    }
    
}


//    private func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let view = UIView(frame: CGRect.zero)
//        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
//        label.text = "TEST TEXT"
//        label.textColor = UIColor.blue
//
//        view.addSubview(label)
//        return view
//    }
//}

// 서치바
//extension InteriorViewController: UISearchBarDelegate {
//    func filter(with keyword: String) {
//        if keyword.count > 0 {
//            filteredList = list.filter { $0.contains(keyword) }
//        } else {
//            filteredList = list
//        }
//
//        listTableView.reloadData()
//        resultLabel.text = "\(filteredList.count) result(s) found"
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filter(with: searchText)
//    }
//
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        listTableView.tableFooterView = resultLabel
//    } // 검색 시작될때 호출됨
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        searchBar.text = nil
//        resultLabel.text = "0 result(s) found"
//        listTableView.tableFooterView = nil
//    } // 검색 종료될떄
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        filter(with: searchBar.text ?? "")
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        filteredList = list
//        listTableView.reloadData()
//
//        searchBar.resignFirstResponder()
//    }
//}
