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
    let searchLabel = UILabel()
    let searchImage = UIImageView()
    let markBackbarbutton = UIBarButtonItem(image: (UIImage(systemName: "bookmark")), style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleBarButton(_:)))
    let cartBackbarbutton = UIBarButtonItem(image: (UIImage(systemName: "cart")), style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleBarButton(_:)))
    let homeTableView = UITableView()

    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        view.backgroundColor = .blue
        navigationController?.hidesBarsOnSwipe = true
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
    }
    final private func setLayout() {
        view.addSubview(homeTableView)
        
    }
    final private func setBasic() {
        navigationItem.rightBarButtonItems = [markBackbarbutton, cartBackbarbutton]
      }
}

